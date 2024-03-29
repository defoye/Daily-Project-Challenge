//
//  Line.swift
//  CABasicAnimation
//
//  Created by Ernest DeFoy on 7/4/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//
// https://collectiveidea.com/blog/archives/2017/12/04/cabasicanimation-for-animating-strokes-plus-a-bonus-gratuitous-ui-interaction

import UIKit

class Line: CAShapeLayer {
	
	override init() {
		super.init()
		
		createLine()
	}
	
	override init(layer: Any) {
		super.init(layer: layer)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension Line {
	func createLine() {
		// 1)
		let bezPath = UIBezierPath()
		bezPath.move(to: CGPoint(x: 15, y: 0))
		let distance = CGFloat(arc4random_uniform(45 - 25) + 25)
		bezPath.addLine(to: CGPoint(x: distance, y: 0))
		
		// 2)
		lineWidth = 2
		lineCap = kCALineCapRound
		strokeColor = UIColor.darkGray.cgColor
		path = bezPath.cgPath
	}
	
	func animate() {
		// 1)
		let duration: CFTimeInterval = 0.6
		
		// 2)
		let end = CABasicAnimation(keyPath: "strokeEnd")
		end.fromValue = 0
		end.toValue = 1.0175
		end.beginTime = 0
		end.duration = duration * 0.75
		end.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
		end.fillMode = kCAFillModeForwards
		
		// 3)
		let begin = CABasicAnimation(keyPath: "strokeStart")
		begin.fromValue = 0
		begin.toValue = 1.0175
		begin.beginTime = duration * 0.15
		begin.duration = duration * 0.85
		begin.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
		begin.fillMode = kCAFillModeBackwards
		
		// 4)
		let group = CAAnimationGroup()
		group.animations = [end, begin]
		group.duration = duration
		
		// 5)
		strokeEnd = 1
		strokeStart = 1
		
		// 6)
		add(group, forKey: "move")
	}
}
