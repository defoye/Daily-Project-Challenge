//
//  StockSymbolsCoordinator.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/24/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol StockSymbolsCoordinatorProtocol {
	var navigationController: UINavigationController { get set }
	init(navigationController: UINavigationController)
}

public class StockSymbolsCoordinator: StockSymbolsCoordinatorProtocol, Coordinator {
	public var navigationController: UINavigationController
	
	public required init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	public func start() {
		let stockSymbolsViewController = StockSymbolsViewController()
		let stockSymbolsDataManager = StockSymbolsDataManager()

		let stockSymbolsViewModel = StockSymbolsViewModel(dataManager: stockSymbolsDataManager)
	}
	
	
}
