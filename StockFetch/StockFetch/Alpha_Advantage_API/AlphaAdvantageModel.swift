//
//  AlphaAdvantageModel.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

struct AlphaAdvantageAPIResponse {
	let metaData: AlphaAdvantageResponseMetaData
	let timeSeries: AlphaAdvantageTimeSeries
}

extension AlphaAdvantageAPIResponse: Decodable {
	private enum CodingKeys: String, CodingKey {
		case metaData = "Meta Data"
		case timeSeries = "Time Series (5min)"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		metaData = try container.decode(AlphaAdvantageResponseMetaData.self, forKey: .metaData)
		timeSeries = try container.decode(AlphaAdvantageTimeSeries.self, forKey: .timeSeries)
	}
}
/////
struct AlphaAdvantageResponseMetaData {
	let information: String
	let symbol: String
//	let lastRefreshed: Date
	let lastRefreshed: String
	let interval: String
	let outputSize: String
	let timeZone: String
}

extension AlphaAdvantageResponseMetaData: Decodable {
	private enum CodingKeys: String, CodingKey {
		case information = "1. Information"
		case symbol = "2. Symbol"
		case lastRefreshed = "3. Last Refreshed"
		case interval = "4. Interval"
		case outputSize = "5. Output Size"
		case timeZone = "6. Time Zone"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		information = try container.decode(String.self, forKey: .information)
		symbol = try container.decode(String.self, forKey: .symbol)
//		lastRefreshed = try container.decode(Date.self, forKey: .lastRefreshed)
		lastRefreshed = try container.decode(String.self, forKey: .lastRefreshed)
		interval = try container.decode(String.self, forKey: .interval)
		outputSize = try container.decode(String.self, forKey: .outputSize)
		timeZone = try container.decode(String.self, forKey: .timeZone)
	}
}
/////

public struct AlphaAdvantageTimeSeries {
	struct AlphaAdvantageTimeSeriesPointKey : CodingKey {
		var stringValue: String
		init?(stringValue: String) {
			self.stringValue = stringValue
		}
		var intValue: Int? { return nil }
		init?(intValue: Int) { return nil }
		
		static let open = AlphaAdvantageTimeSeriesPointKey(stringValue: "1. open")!
		static let high = AlphaAdvantageTimeSeriesPointKey(stringValue: "2. high")!
		static let low = AlphaAdvantageTimeSeriesPointKey(stringValue: "3. low")!
		static let close = AlphaAdvantageTimeSeriesPointKey(stringValue: "4. close")!
		static let volume = AlphaAdvantageTimeSeriesPointKey(stringValue: "5. volume")!

	}
	
	// TODO
	enum MyValue {
		case integer(Int)
		case string(String)
		case float(Float)
	}
	
	let alphaAdvantageTimeSeries : [AlphaAdvantageTimeStamp]
}

struct AlphaAdvantageTimeStamp : Codable {
	//		let timeStamp: Date
	let timeStampString: String
	let open: Float
	let high: Float
	let low: Float
	let close: Float
	let volume: Float
}

extension AlphaAdvantageTimeSeries: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: AlphaAdvantageTimeSeriesPointKey.self)
		
		
		var timeSeries: [AlphaAdvantageTimeStamp] = []
		for key in container.allKeys {
			let nested = try container.nestedContainer(keyedBy: AlphaAdvantageTimeSeriesPointKey.self,
													   forKey: key)
//			let open = try nested.decode(Float.self, forKey: .open)
//			let high = try nested.decode(Float.self, forKey: .high)
//			let low = try nested.decode(Float.self, forKey: .low)
//			let close = try nested.decode(Float.self, forKey: .close)
//			let volume = try nested.decode(Float.self, forKey: .volume)
			let open = try Float(nested.decode(String.self, forKey: .open)) ?? -1
			let high = try Float(nested.decode(String.self, forKey: .high)) ?? -1
			let low = try Float(nested.decode(String.self, forKey: .low)) ?? -1
			let close = try Float(nested.decode(String.self, forKey: .close)) ?? -1
			let volume = try Float(nested.decode(String.self, forKey: .volume)) ?? -1
			
//			let formatter = DateFormatter.fullISO8601
//			let timeStamp: Date? = formatter.date(from: key.stringValue)
			let timeStampString = key.stringValue

			timeSeries.append(AlphaAdvantageTimeStamp(timeStampString: timeStampString, open: open, high: high, low: low, close: close, volume: volume))
		}
		
		self.alphaAdvantageTimeSeries = timeSeries
	}
}
