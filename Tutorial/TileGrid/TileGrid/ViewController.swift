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

    let numViewPerRow = 50
    var cells = [String : UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        let numRows: Int = Int(view.frame.height / width)
        
        for j in 0...numRows {
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
    
    func inCellsBounds(i: Int, j: Int) -> Bool {
        let width = view.frame.width / CGFloat(numViewPerRow)
        return i >= 0 && i < numViewPerRow && j >= 0 && j < Int(view.frame.height / width)
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

