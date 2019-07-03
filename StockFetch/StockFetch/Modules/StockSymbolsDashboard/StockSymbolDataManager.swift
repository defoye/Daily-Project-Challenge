//
//  StockSymbolDataManager.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/24/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol StockSymbolsDataManagerProtocol {
	func fetchStockSymbols() -> [StockSymbolsModel]?
}

public class StockSymbolsDataManager: StockSymbolsDataManagerProtocol, NetworkManager {
	public func fetchStockSymbols() -> [StockSymbolsModel]? {
		return nil
	}
	
	
}
