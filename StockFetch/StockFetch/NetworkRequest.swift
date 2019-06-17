//
//  Fetch.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/15/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

class NetworkRequest {
    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
//    let session1 = URLSession(configuration: URLSessionConfiguration.ephemeral, delegate: nil, delegateQueue: <#T##OperationQueue?#>)
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func execute(withCompletion completion: @escaping (Data?) -> Void) {
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, _, _) -> Void in
            completion(data)
        })
        task.resume()
    }
}

//class Fetch {
//    
//    var stockData: [StockDateModel] = []
//    
//    public func fetch() {
//        let url = constructURLForSymbol(symbol: "AAPL")
//
//        URLSession.shared.dataTask(with: url) {data,_,err in
//            if let err = err {
//                print(err)
//            }
//
//            guard let data = data else {return}
//            
//            do {
//                let decoder = JSONDecoder()
//                let stockHistory = try decoder.decode(StockHistory.self, from: data)
//                self.stockData = stockHistory.stocks
//                
//                print("Symbol: \(stockHistory.symbol)")
//                print("\(self.stockData.count) days of data, which is \(Double(self.stockData.count)/365.0) years")
//
//            } catch let json_err{
//                print(json_err)
//            }
//        }.resume()
//    }
//    
//    public func constructURLForSymbol(symbol: String) -> URL {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.worldtradingdata.com"
//        components.path = "/api/v1/history"
//        components.queryItems = [
//            URLQueryItem(name: "symbol", value: symbol),
//            URLQueryItem(name: "api_token", value: "8ZC3vUHXTaAr04d0elr1yNzo2WU2VlMgJuXxvRwX4gLhPospKkoZgsmpAZu2")]
//        
//        return components.url!
//    }
//}
//

