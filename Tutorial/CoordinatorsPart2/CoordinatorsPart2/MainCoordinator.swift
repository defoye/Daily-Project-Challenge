//
//  MainCoordinator.swift
//  CoordinatorsPart2
//
//  Created by Ernest DeFoy on 6/18/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit
/*
   The key to remember is that one view controller doesn't know that the others
   exist. It's passing data to the coordinator, and then can go anywhere.  Maybe
   it triggers network requests, maybe it shows a view controller, or maybe it
   does something else entirely. The coordinator figure out the destination-- it
   decides what the values it receives should mean.

   Coordinators are effectively just a specialized delegate.
   The advantage to using 'coordinator' for the name, is that it's clear that
   this is a specialized delegate that handles navigation around our app.
You could have several different delegates for a single view controller, all
working together to make it work inside our app (such as NAVIGATION, DATA SOURCE,
DELEGATE).  It would be confusing, if you have to use the name delegate.  But
by naming this thing the coordinator, we're making its role clear: it’s the thing
driving our app forward.
Rather than just renaming our coordinator to be a delegate and leaving it there,
we have two alternatives. I want to show them to you both here, but please roll
back to your original coordinators project again to avoid confusion.
*/
class MainCoordinator: Coordinator {
	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let vc = ViewController.instantiate()
		vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
	
	func buySubscription(to productType: Int) {
		let vc = BuyViewController.instantiate()
		vc.selectedProduct = productType
		vc.delegate = self
		navigationController.pushViewController(vc, animated: true)
	}
	
	func createAccount() {
		let vc = CreateAccountViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
}
