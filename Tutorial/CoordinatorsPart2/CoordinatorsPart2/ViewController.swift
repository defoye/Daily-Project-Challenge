//
//  ViewController.swift
//  CoordinatorsPart2
//
//  Created by Ernest DeFoy on 6/18/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

	weak var coordinator: MainCoordinator?
	
	@IBOutlet weak var product: UISegmentedControl!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	
	@IBAction func buyTapped(_ sender: Any) {
		coordinator?.buySubscription(to: product.selectedSegmentIndex)
	}
	@IBAction func createTapped(_ sender: Any) {
		coordinator?.createAccount()
	}
}

