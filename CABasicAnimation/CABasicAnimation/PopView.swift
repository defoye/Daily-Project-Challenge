//
//  PopView.swift
//  CABasicAnimation
//
//  Created by Ernest DeFoy on 7/4/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class PopView: UIView {
	
	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
		
		isUserInteractionEnabled = false
		
		// Create 6 lines and rotate them around the center
		for number in 1...6 {
			let line = Line()
			line.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
			line.transform = CATransform3DMakeRotation(CGFloat.pi * 2 / CGFloat(6) * CGFloat(number), 0, 0, 1)
			self.layer.addSublayer(line)
			line.animate()
		}
		
		// Slightly rotate the angle of the view so it changes slightly per instance
		let minOffset: UInt32 = 0
		let maxOffset: UInt32 = 200
		let rotation = CGFloat(arc4random_uniform(maxOffset - minOffset) + minOffset) / CGFloat(100)
		transform = CGAffineTransform(rotationAngle: rotation)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
