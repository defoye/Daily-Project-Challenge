//
//  EndPointType.swift
//  NetworkingLayer
//
//  Created by Ernest DeFoy on 6/19/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

// This will define a URLRequest with all its comprising components such as headers, query parameters, and body parameters
protocol EndPointType {
	var baseURL: URL { get }
	var path: String { get }
	var httpMethod: HTTPMethod { get }
	var task: HTTPTask { get }
	var headers: HTTPHeaders? { get }
}
