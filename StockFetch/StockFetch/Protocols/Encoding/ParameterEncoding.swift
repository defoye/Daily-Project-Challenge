//
//  ParameterEncoding.swift
//  NetworkingLayer
//
//  Created by Ernest DeFoy on 6/19/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

// Just using a typealias to make the code cleaner and more concise.
public typealias Parameters = [String: Any]

// Implemented by a JSONParameterEncoder and a URLParameterEncoder
// A ParameterEncoder performs one function which is to encode parameters. This method can fail so it throws and needs to be handled.
public protocol ParameterEncoder {
	static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

