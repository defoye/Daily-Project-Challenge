//
//  Stock.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

struct StockHistory: Decodable {
    let symbol: String
    let stocks: [StockDateModel]
    
    private enum CodingKeys : String, CodingKey {
        case history = "history"
        case symbol = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dictionary: [String: [String: String]] = try container.decode([String: [String: String]].self, forKey: .history)
        symbol = try container.decode(String.self, forKey: .symbol)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        var arr: [StockDateModel] = []
        
        for pair in dictionary {
            let dict = pair.value
            let date = formatter.date(from: pair.key) ?? formatter.date(from: "1950-01-01")
            let dateString = pair.key
            let openPrice = Double(dict["open"] ?? "-1.0") ?? -2.0
            let closePrice = Double(dict["close"] ?? "-1.0") ?? -2.0
            let highPrice = Double(dict["high"] ?? "-1.0") ?? -2.0
            let lowPrice = Double(dict["low"] ?? "-1.0") ?? -2.0
            let volume = Int(dict["volume"] ?? "-1") ?? -2
        
            let stockDateData = StockDateModel(date: date!, dateString: dateString, open: openPrice, close: closePrice, high: highPrice, low: lowPrice, volume: volume)
            arr.append(stockDateData)
        }
        stocks = arr
    }
}

struct StockDateModel {
    let date: Date
    let dateString: String
    let open: Double
    let close: Double
    let high: Double
    let low: Double
    let volume: Int
    
    init(date: Date, dateString: String, open: Double, close: Double, high: Double, low: Double, volume: Int) {
        self.date = date
        self.dateString = dateString
        self.open = open
        self.close = close
        self.high = high
        self.low = low
        self.volume = volume
    }
}
