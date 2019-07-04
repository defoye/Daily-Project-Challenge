//
//  ViewController.swift
//  TryOutViews
//
//  Created by Ernest DeFoy on 6/23/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	let customView: StockView = {
		let view = StockView()
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view = customView
	}


}

