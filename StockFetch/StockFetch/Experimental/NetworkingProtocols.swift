//
//  NetworkingProtocols.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/19/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

struct Model: Decodable {
	
}

//protocol ApiResource {
//	associatedtype Model
//	var url: URL { get }
//	func makeModel(serialization: JSONDecoder) -> Model
//}
//
//extension ApiResource {
//	func makeModel(data: Data) -> [Model]? {
//		let decoder = JSONDecoder()
//		guard let json = try? decoder.decode(Model.self, from: data) else {
//			NSLog("%s %s.\n", "decoding", "issue")
//			print("decoding issue")
//			return nil
//		}
//	}
//}
