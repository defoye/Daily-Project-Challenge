//
//  Coordinator.swift
//  CoordinatorsPart2
//
//  Created by Ernest DeFoy on 6/18/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
