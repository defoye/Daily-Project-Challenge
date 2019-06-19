//
//  ViewController.swift
//  Coordinators
//
//  Created by Ernest DeFoy on 6/17/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
	
	weak var coordinator: MainCoordinator?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


	@IBAction func buyTapped(_ sender: Any) {
		coordinator?.buySubscription()
	}
	@IBAction func createTapped(_ sender: Any) {
		coordinator?.createAccount()
	}
}

