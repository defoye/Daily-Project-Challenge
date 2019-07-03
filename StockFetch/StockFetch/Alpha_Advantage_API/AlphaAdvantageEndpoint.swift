//
//  AlphaAdvantageEndpoint.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

enum AlphaAdvantageNetworkEnvironment {
	case alphaAdvantageEnvironment
}

public enum AlphaAdvantageAPI {
	case timeSeriesIntraday(function: String, symbol: String, interval: String)
}

extension AlphaAdvantageAPI: EndPointType {
	
	var environmentBaseURL : String {
		switch AlphaAdvantageDataManager.environment {
		case .alphaAdvantageEnvironment: return "https://www.alphavantage.co/"
		}
	}
	
	var baseURL: URL {
		guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
		return url
	}
	
	var path: String {
		switch self {
		case .timeSeriesIntraday:
			return "query"
		}
	}
	
	var httpMethod: HTTPMethod {
		return .get
	}

	var task: HTTPTask {
		switch self {
		case .timeSeriesIntraday(let function, let symbol, let interval):
			return .requestParameters(bodyParameters: nil,
									  urlParameters: ["function":function,
													  "symbol":symbol,
													  "interval":interval,
													  "apikey":AlphaAdvantageDataManager.AlphaAdvantageAPIKey])
		default:
			return .request
		}
	}
	
	var headers: HTTPHeaders? {
		return nil
	}
}

