//
//  StockPlotCoordinator.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol Coordinator {
	func start()
}

extension Coordinator {
	
}

public class StockPlotCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
	let navigationController: UINavigationController
	
	public init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
}

extension StockPlotCoordinator {
	
	public func start() {
//		let stockPlotViewController = StockPlotViewController()
//		let stockPlotViewModel = StockPlotViewModel()
//		let stockPlotDataManager = St
	}
}
