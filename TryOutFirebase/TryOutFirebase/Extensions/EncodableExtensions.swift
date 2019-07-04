//
//  EncodableExtensions.swift
//  TryOutFirebase
//
//  Created by Ernest DeFoy on 6/25/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

extension Encodable {
	func asDictionary() throws -> [String: Any] {
		let data = try JSONEncoder().encode(self)
		guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
			throw NSError()
		}
		return dictionary
	}
	
	func tryAsDictionary() -> [String : Any] {
		do {
			let dictionary = try self.asDictionary()
			return dictionary
		} catch let err {
			print("Encoding error: \(err)")
		}
		
		return [:]
	}
}
