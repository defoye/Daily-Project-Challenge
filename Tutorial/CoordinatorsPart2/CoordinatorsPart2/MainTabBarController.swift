//
//  MainTabBarController.swift
//  CoordinatorsPart2
//
//  Created by Ernest DeFoy on 6/18/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	let main = MainCoordinator(navigationController: UINavigationController())

	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		// Use the navigation controller of each coordinator being worked with for the tab bar array.
		main.start()
		viewControllers = [main.navigationController]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
