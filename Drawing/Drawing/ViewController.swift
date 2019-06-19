//
//  ViewController.swift
//  Drawing
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backView = UIView()
    let customView = E3LinePlot()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
		view.addSubview(backView)
        setupBackViewConstraints()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		let frame = backView.frame
		customView.frame =  frame
		customView.backgroundColor = .green
		view.addSubview(customView)
		
		var x: CGFloat = 0.0
		var y: CGFloat = 0.0
		
		var points: [CGPoint] = []
		
		for _ in 0...1000 {
			y = x*x * 0.02
			points.append(CGPoint(x: x, y: y))
			x = x + 1
		}
		
		customView.points = points
		customView.setNeedsLayout()
	}

    func setupBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .orange
        let safe = self.view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: safe.topAnchor),
									 backView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
									 backView.leftAnchor.constraint(equalTo: safe.leftAnchor),
									 backView.rightAnchor.constraint(equalTo: safe.rightAnchor)])
    }
	
//	func setupBackViewConstraints() {
//		backView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//		backView.translatesAutoresizingMaskIntoConstraints = false
//		backView.backgroundColor = .orange
//		let safe = self.view.safeAreaLayoutGuide
//		NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: safe.topAnchor),
//									 backView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
//									 backView.leftAnchor.constraint(equalTo: safe.leftAnchor),
//									 backView.rightAnchor.constraint(equalTo: safe.rightAnchor)])
//	}
}

