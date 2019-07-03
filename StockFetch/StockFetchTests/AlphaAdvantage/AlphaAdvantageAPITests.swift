//
//  AlphaAdvantageAPITests.swift
//  StockFetchTests
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import XCTest
@testable import StockFetch

class AlphaAdvantageAPITests: XCTestCase {
	func testStockHistoryDecoding() {
		
		let bundle = Bundle(for: type(of: self))
		guard let url = bundle.url(forResource: "take2", withExtension: "json"),
			let data = try? Data(contentsOf: url) else {
				XCTFail()
				return
		}
		
		let decoder = JSONDecoder()
		
		do {
			let alphaAdvantageAPIResponse = try decoder.decode(AlphaAdvantageAPIResponse.self, from: data)
			
			let metaData = alphaAdvantageAPIResponse.metaData
			
			XCTAssertEqual(metaData.information, "Intraday (5min) open, high, low, close prices and volume")
			XCTAssertEqual(metaData.symbol, "MSFT")
			XCTAssertEqual(metaData.lastRefreshed, "2019-06-21 16:00:00")
			XCTAssertEqual(metaData.interval, "5min")
			XCTAssertEqual(metaData.outputSize, "Compact")
			XCTAssertEqual(metaData.timeZone, "US/Eastern")

			let timeSeries = alphaAdvantageAPIResponse.timeSeries.alphaAdvantageTimeSeries
			var secondTimeStamp = timeSeries[1]
			
			for timeStamp in timeSeries {
				XCTAssert(timeStamp.open > 136)
				XCTAssert(timeStamp.high < 138)
				XCTAssert(timeStamp.low > 136)
				XCTAssert(timeStamp.close < 137.9)
				XCTAssert(timeStamp.volume < 1900000)
				
				if (timeStamp.timeStampString == "2019-06-21 15:55:00") {
					secondTimeStamp = timeStamp
				}
			}
			
			XCTAssertEqual(secondTimeStamp.timeStampString, "2019-06-21 15:55:00")
			XCTAssertEqual(secondTimeStamp.open, 137.2100)
			XCTAssertEqual(secondTimeStamp.high, 137.2400)
			XCTAssertEqual(secondTimeStamp.low, 137.0900)
			XCTAssertEqual(secondTimeStamp.close, 137.1400)
			XCTAssertEqual(secondTimeStamp.volume, 468985)
		} catch let err {
			print(err)
			XCTFail("couldn't decode data")
		}
	}
	
	func testOnlineDecoding() {
//		let stockHistory = (try? decoder.decode(StockHistory.self, from: data)) ?? nil

		        let url = self.symbol()
		        let request = NetworkRequest(url: url)
		        request.execute { [weak self] (data) in
					
					if let data = data {
						let decoder = JSONDecoder()
						
						do {
							let alphaAdvantageAPIResponse = try decoder.decode(AlphaAdvantageAPIResponse.self, from: data)
							
							let metaData = alphaAdvantageAPIResponse.metaData
							
							XCTAssertEqual(metaData.information, "Intraday (5min) open, high, low, close prices and volume")
							XCTAssertEqual(metaData.symbol, "MFT")
							XCTAssertEqual(metaData.lastRefreshed, "2019-06-21 16:00:00")
							XCTAssertEqual(metaData.interval, "5min")
							XCTAssertEqual(metaData.outputSize, "Compact")
							XCTAssertEqual(metaData.timeZone, "US/Eastern")
							print(alphaAdvantageAPIResponse)
							return
						} catch let err {
							print("Err: \(err)")
							XCTFail()
						}
					} else {
						XCTFail()
					}
					XCTFail()
		        }
		print("What the fuck")

	}
}

extension AlphaAdvantageAPITests {
	func symbol() -> URL {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "www.alphavantage.co"
		components.path = ""
		components.queryItems = [
			URLQueryItem(name: "function", value: "TIME_SERIES_INTRADAY"),
			URLQueryItem(name: "symbol", value: "MSFT"),
			URLQueryItem(name: "interval", value: "5min"),
			URLQueryItem(name: "apikey", value: "R0NHZXGAGUEW9HIY")]
		
		return components.url!
	}
}
