//
//  Router.swift
//  NetworkingLayer
//
//  Created by Ernest DeFoy on 6/19/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

//More complex configurations of a URLSession can be implemented using configurations that can change the behavior of the session. For more on this I would suggest taking some time to read this post--https://www.raywenderlich.com/567-urlsession-tutorial-getting-started

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
//	This task is essentially what will do all the work. We keep the variable private as we do not want anyone outside this class modifying our task.
	private var task: URLSessionTask?
	
	func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
		let session = URLSession.shared
		do {
			let request = try self.buildRequest(from: route)
			task = session.dataTask(with: request, completionHandler: { data, response, error in
				completion(data, response, error)
			})
		} catch {
			completion(nil, nil, error)
		}
		self.task?.resume()
	}
	
	func cancel() {
		self.task?.cancel()
	}
	

}

extension Router {
	fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
		var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
		
		request.httpMethod = route.httpMethod.rawValue
		do {
			switch route.task {
			case .request:
				request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			case .requestParameters(let bodyParameters, let urlParameters):
				try self.configureParameters(bodyParameters: bodyParameters,
											 urlParameters: urlParameters,
											 request: &request)
			case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionalHeaders):
				self.addAdditionalHeaders(additionalHeaders, request: &request)
				try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
			}
			return request
		} catch {
			throw error
		}
	}
	
	fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
		do {
			if let bodyParameters = bodyParameters {
				try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
			}
			if let urlParameters = urlParameters {
				try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
			}
		} catch {
			throw error
		}
	}
	
	fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
		guard let headers = additionalHeaders else { return }
		for (key,value) in headers {
			request.setValue(value, forHTTPHeaderField: key)
		}
	}
}
