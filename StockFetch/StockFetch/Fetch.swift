//
//  Fetch.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/15/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

struct Stock: Codable {
    let data: [[String : String]]?
    
    private enum CodingKeys : String, CodingKey {
        case data = "data"
    }
}



class Fetch {
    
    var stock: Stock?
    var dict: [String : String] = [:]
    
    public func fetch() {
        let url = constructURLForSymbol(symbol: "AAPL")

        URLSession.shared.dataTask(with: url) {data,_,err in
            if let err = err {
                print("error")
            }

            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let stockData = try decoder.decode(Stock.self, from: data)
                
                if let dict = stockData.data {
                    self.dict = dict[0]
                    print(dict)
                }

            } catch let json_err{
                print(json_err)
            }
        }.resume()
    }
    
    public func constructURLForSymbol(symbol: String) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.worldtradingdata.com"
        components.path = "/api/v1/stock"
        components.queryItems = [
            URLQueryItem(name: "symbol", value: symbol),
            URLQueryItem(name: "api_token", value: "8ZC3vUHXTaAr04d0elr1yNzo2WU2VlMgJuXxvRwX4gLhPospKkoZgsmpAZu2")]
        
        return components.url!
    }
}

