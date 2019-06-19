//
//  BuyViewController.swift
//  Coordinators
//
//  Created by Ernest DeFoy on 6/17/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {

	weak var coordinator: BuyCoordinator?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	/* Buying has finished, so view will disappear */
//	override func viewDidDisappear(_ animated: Bool) {
//		super.viewDidDisappear(animated)
//		coordinator?.didFinishBuying()
//	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
