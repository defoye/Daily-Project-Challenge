//
//  Storyboarded.swift
//  E3Core
//
//  Created by Ernest DeFoy on 6/25/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

protocol Storyboarded {
	static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
	static func instantiate() -> Self {
		let id = String(describing: self)
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		return storyboard.instantiateViewController(withIdentifier: id) as! Self
	}
}
