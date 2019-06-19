//
//  Coordinator.swift
//  Coordinators
//
//  Created by Ernest DeFoy on 6/17/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

// Make Coordinator class-only by adding AnyObject
protocol Coordinator: AnyObject {
	// What if we have multiple View Controllers being shown in the child coordinator?  viewDidDisappear will be called prematurely, and the coordinator stack will get confused. 
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
