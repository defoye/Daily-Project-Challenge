//
//  CustomView.swift
//  Drawing
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

private struct Constants {
	static let plusLineWidth: CGFloat = 2.0
	static let plusButtonScale: CGFloat = 0.6
	static let halfPointShift: CGFloat = 0.5
	
	static let drawBuffer: CGFloat = 30
}

class CustomView: UIView {
	
	var points: [CGPoint] = [CGPoint(x: 0.0, y: 1.0),
							 CGPoint(x: 4.0, y: 5),
							 CGPoint(x: 5.0, y: 10),
							 CGPoint(x: 7000, y: 8000)]
	
	private var halfWidth: CGFloat {
		return self.frame.width / 2
	}
	
	private var halfHeight: CGFloat {
		return self.frame.height / 2
	}
	
	// Only override draw() if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
		
		if points.count == 0 {
			return
		}
		
		var maxX: CGFloat = 0.0
		var maxY: CGFloat = 0.0
		
		for point in points {
			if point.x > maxX {
				maxX = point.x
			}
			if point.y > maxY {
				maxY = point.y
			}
		}
		
		let width: CGFloat = self.bounds.width
		let height: CGFloat = self.bounds.height
		
		
		//create the path
		let plusPath = UIBezierPath()
		
		//set the path's line width to the height of the stroke
		plusPath.lineWidth = Constants.plusLineWidth
		
		//move the initial point of the path
		//to the start of the horizontal stroke
		plusPath.move(to: CGPoint(
			x: self.bounds.minX,
			y: self.bounds.maxY))
		
		for point in points {
			//add a point to the path at the end of the stroke
			let scaledX = width * (point.x / maxX)
			let scaledY = height - (height * (point.y / maxY))
			
			plusPath.addLine(to: CGPoint(x: scaledX, y: scaledY))
		}
		
		plusPath.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.maxY))
		plusPath.addLine(to: CGPoint(x: self.bounds.minX, y: self.bounds.maxY))

		
		//set the stroke color
		UIColor.black.setStroke()
		UIColor.white.setFill()
		
		//draw the stroke
		plusPath.stroke()
		plusPath.fill()
	}
	
}
