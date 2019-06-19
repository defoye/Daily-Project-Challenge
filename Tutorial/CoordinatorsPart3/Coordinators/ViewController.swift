//
//  ViewController.swift
//  Coordinators
//
//  Created by Ernest DeFoy on 6/17/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
	
	// refer to those protocols rather than a concrete type
	//We don’t care what coordinator implements those two protocols, as long as something does (it might be a coordinator, or it might be something else).
//	 Using protocols is really useful when working in large apps where you want much more flexibility, because you can add extra protocols freely, swap in different coordinators for A/B testing, and more.
/*	weak var coordinator: (Buying & AccountCreating)? */
	
//	Another option is to remove the concrete coordinator type and remove protocols and use a closure instead. This works well when you have only one or two actions being triggered by a view controller.
	
//	To use this approach, start by defining each of our closures as properties
	var buyAction: (() -> Void)?
	var createAccountAction: (() -> Void)?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


	@IBAction func buyTapped(_ sender: Any) {
		/* coordinator?.buySubscription() */
		buyAction?()
	}
	@IBAction func createTapped(_ sender: Any) {
		/* coordinator?.createAccount() */
		createAccountAction?()
	}
}

