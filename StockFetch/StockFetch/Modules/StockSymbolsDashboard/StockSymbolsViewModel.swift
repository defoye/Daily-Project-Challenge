//
//  StockSymbolsViewModel.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/24/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol StockSymbolsViewModelProtocol {
	var dataManager: StockSymbolsDataManager { get set }
	init(dataManager: StockSymbolsDataManager)
}

public class StockSymbolsViewModel: StockSymbolsViewModelProtocol {
	public var dataManager: StockSymbolsDataManager
	
	public required init(dataManager: StockSymbolsDataManager) {
		self.dataManager = dataManager
	}
	
	
}
