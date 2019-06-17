//
//  StockFetchTests.swift
//  StockFetchTests
//
//  Created by Ernest DeFoy on 6/15/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import XCTest
@testable import StockFetch

class StockFetchTests: XCTestCase {
    
    func testFetchOrder() {
        
    }
    
    func testStockHistoryDecoding() {
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "StockHistory", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail()
                return
        }
        
        let decoder = JSONDecoder()
        
        guard let stockHistory = try? decoder.decode(StockHistory.self, from: data) else {
            XCTFail("couldn't decode data")
            return
        }
        
        XCTAssertEqual(stockHistory.symbol, "AAPL")
        
        for price in stockHistory.stocks {
            XCTAssert(price.open > 191)
            XCTAssert(price.close > 192)
            XCTAssert(price.high > 193)
            XCTAssert(price.low > 190)
            print(price.date.description)
        }
    }
    
    func testStockHistoryDecoder() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "StockHistory", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail()
                return
        }
        
        let decoder = JSONDecoder()
        do {
            let openPrice = try decoder.decode(StockHistory.self, from: data)
            print(openPrice)
        } catch let errr {
            print(errr)
            XCTFail()
        }
        
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
