//
//  NetworkManager.swift
//  NetworkingLayer
//
//  Created by Ernest DeFoy on 6/19/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
	case success
	case authenticationError = "You need to be authenticated first."
	case badRequest = "Bad request"
	case outDated = "The url you requested is outdated."
	case failed = "Network request failed"
	case noData = "Response returned with no data to decode."
	case unableToDecode = "We could not decode the response."
}

enum Result<String> {
	case success
	case failure(String)
}

struct NetworkManager {
	static let environment: NetworkEnvironment = .production
	// TODO: get key.
	static let MovieAPIKey = "YOUR_API_KEY"
	private let router = Router<MovieApi>()
	
	fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
		switch response.statusCode {
		case 200...299: return .success
		case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
		case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
		case 600: return .failure(NetworkResponse.outDated.rawValue)
		default: return .failure(NetworkResponse.failed.rawValue)
		}
	}
	
	// 1.
	func getNewMovies(page: Int, completion: @escaping (_ movie: [Movie]?,_ error: String?) ->()) {
		
		// 2.
		router.request(.newMovies(page: page)) { data,response,error in
			// 3.
			if error != nil {
				completion(nil, "Please check your network connection.")
			}
			// 4/
			if let response = response as? HTTPURLResponse {
				// 5.
				let result = self.handleNetworkResponse(response)
				switch result {
				// 6.
				case .success:
					guard let responseData = data else {
						completion(nil, NetworkResponse.noData.rawValue)
						return
					}
					// 7.
					do {
						let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
						completion(apiResponse.movies,nil)
					} catch {
						completion(nil, NetworkResponse.unableToDecode.rawValue)
					}
					// 8.
				case .failure(let networkFailureError):
					completion(nil, networkFailureError)
				}
			}
		}
	}
}




