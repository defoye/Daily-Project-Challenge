//
//  Date.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

// TODO: date print
//let dateFormatterGet = DateFormatter()
//dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
//
//let dateFormatterPrint = DateFormatter()
//dateFormatterPrint.dateFormat = "MMM dd,yyyy"
//
//if let date = dateFormatterGet.date(from: "2016-02-29 12:24:26") {
//	print(dateFormatterPrint.string(from: date))
//} else {
//	print("There was an error decoding the string")
//}

extension DateFormatter {
	static let fullISO8601: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		return formatter
	}()
	
//	static let alphaAdvantageFormat: DateFormatter = {
//		let formatter = DateFormatter()
//		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//		formatter.calendar = Calendar(identifier: .iso8601)
//		formatter.timeZone = TimeZone(secondsFromGMT: 0)
//		formatter.locale = Locale(identifier: "en_US_POSIX")
//		return formatter
//	}()
}
