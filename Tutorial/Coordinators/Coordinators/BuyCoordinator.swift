//
//  BuyCoordinator.swift
//  Coordinators
//
//  Created by Ernest DeFoy on 6/18/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

class BuyCoordinator: Coordinator {
	// Make weak because the parent already owns the child (ie, the MainCoordinator already owns the BuyCoordinator)
	weak var parentCoordinator: MainCoordinator?
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let vc = BuyViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
	
	/*
	func didFinishBuying() -- If MainCoordinator needs to respond specific to Buy and finishing, perhaps to synchronize user data, or call some UI to refresh, then you might implement a specific method to handle that flow.  In this instance, though, we write a general method to handle all child coordinators that don't need special behavior.
	*/
	/* got rid of with viewDidDisappear in BuyViewController */
//	func didFinishBuying() {
//		parentCoordinator?.childDidFinish(self)
//	}
}
