//
//  MainCoordinator.swift
//  Coordinators
//
//  Created by Ernest DeFoy on 6/17/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

/**
 * Make the main coordinator detect interactions with the navigation controller directly.
 * Subclassing UINavigationController is only possible by subclassing NSObject.
 * Second, we need to ask our navigation controller to tell us whenever a viewcontroller
 * is shown, by making our main coordinator its delegate.
 * By using the UINavigationControllerDelegate protocol, we can monitor events like
 * clicking 'back' navigation button easily.
 */
class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
	var childCoordinators = [Coordinator]()
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		// Now we can detect when our view controller is shown
		navigationController.delegate = self
		
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
	
	func buySubscription() {
		let child = BuyCoordinator.init(navigationController: navigationController)
		child.parentCoordinator = self
		childCoordinators.append(child)
		child.start()
	}
	
	func createAccount() {
		let vc = CreateAccountViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
	
	// Finds the child coordinator in the array.  This '===' only works
	//	for classes, and in theory, our coordinators can be used by structs.
	//	Fortunately, our coordinators should always be classes. They need
	//	to be shared in lots of places.  So, we can mark a coordinator
	//	protocol as being class-only to make all the code work (by using
	//	AnyObject).
	func childDidFinish(_ child: Coordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() {
			if coordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
	}
	
	func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
		//  First, we'll read the view controller we're moving from
		guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
			return
		}
		//	Next we'll check whether our view controller array already contains our
		//	view controller. If it does, it means you're pushing a different view
		//	controller on top, rather than popping it, so it will exit.
		if navigationController.viewControllers.contains(fromViewController) {
			return
		}
		
		//  If we're still here, it means we're popping the view controller, so we can
		//  check whether it's a BuyViewController.
		if let buyViewController = fromViewController as? BuyViewController {
			// And if it is that thing, we'll end the coordinator
			childDidFinish(buyViewController.coordinator)
		}
	}
}
