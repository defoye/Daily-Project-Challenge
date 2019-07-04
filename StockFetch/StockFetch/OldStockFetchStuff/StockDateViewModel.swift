//
//  StockDateViewModel.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//
//
//import Foundation
//
//class StockDateViewModel {
//    
//    private let stockDateModels: [StockDateModel] = []
//    
//    public func getDate(forIndex i: Int) -> Date {
//        let stockDateModel = stockDateModels[i]
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        let date = formatter.date(from: stockDateModel.dateString) ?? formatter.date(from: "1950-01-01")
//        
//        return date!
//    }
//}
