//
//  LaunchFetchTests.swift
//  LaunchFetchTests
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import XCTest
@testable import LaunchFetch

class LaunchFetchTests: XCTestCase {
    
    func testLaunchDecoding() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Launch", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                XCTFail("couldn't load file")
                return
        }
        
        let decoder = JSONDecoder()
        // Now using the codingkeys, we do not have to convertFromSnakeCase
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
        guard let launch = try? decoder.decode(Launch.self, from: data) else {
            XCTFail("couldn't decode data")
            return
        }
        
        XCTAssertEqual(launch.flightNumber, 67)
        XCTAssertEqual(launch.missionName, "Merah Putih")
        XCTAssertEqual(launch.date, Date(timeIntervalSince1970: 1533619080))
        XCTAssertEqual(launch.succeeded, true)
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
