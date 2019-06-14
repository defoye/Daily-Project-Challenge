//
//  ViewController.swift
//  TileGrid
//
//  Created by Ernest DeFoy on 6/14/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

/**
 This code is taken (legally) directly from Brian Voong's YouTube video.
 Link: https://www.youtube.com/watch?v=Wi713xoTVsU&list=PL0dzCUj1L5JFT47RJPN_9P9TXFyLBicJr&index=2
 */

import UIKit

class ViewController: UIViewController {

    let numViewPerRow = 18
    var cells = [String : UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        for j in 0...40 {
            for i in 0...numViewPerRow {
                let tileView = UIView()
                tileView.backgroundColor = randomColor()
                tileView.frame = CGRect(x: CGFloat(CGFloat(i)*width), y: CGFloat(j)*width, width: width, height: width)
                tileView.layer.borderWidth = 0.5
                tileView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(tileView)
                
                let key = "\(i)|\(j)"
                cells[key] = tileView
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        let key = "\(i)|\(j)"

        let tileView = cells[key]
        tileView?.backgroundColor = .white
    }

    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

