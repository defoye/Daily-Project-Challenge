//
//  Coordinator.swift
//  E3Core
//
//  Created by Ernest DeFoy on 6/19/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

// Make Coordinator class-only by adding AnyObject
protocol Coordinator: AnyObject {


	// What if we have multiple View Controllers being shown in the child coordinator?  viewDidDisappear will be called prematurely, and the coordinator stack will get confused.
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	var currentVC: UIViewController?  { get }
	
	func start()
	func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
	public var currentVC: UIViewController? {
		return navigationController.viewControllers.last
	}
	private func startNew(coordinator: Coordinator) {
		coordinator.start()
		childCoordinators.append(coordinator)
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
}

protocol ParentCoordinator: Coordinator {
	var childCoordinators: [Coordinator] { get set }
}


protocol ChildCoordinator: Coordinator {
	var parentCoordinator: MainCoordinator { get }
	func finish()
}
