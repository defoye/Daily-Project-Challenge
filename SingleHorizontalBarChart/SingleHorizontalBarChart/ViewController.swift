//
//  ViewController.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/12/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

// MARK: Default data for testing.

// purple 165, 105, 189
let CUSTOM_PURPLE = UIColor(red: 165/255, green: 105/255, blue: 189/255, alpha: 1)
// blue 93, 173, 226
let CUSTOM_BLUE = UIColor(red: 93/255, green: 173/255, blue: 226/255, alpha: 1)
// green 88, 214, 141
let CUSTOM_GREEN = UIColor(red: 88/255, green: 214/255, blue: 141/255, alpha: 1)
// orange 245, 176, 65
let CUSTOM_ORANGE = UIColor(red: 245/255, green: 176/255, blue: 65/255, alpha: 1)
// yellow 244, 208, 63
let CUSTOM_YELLOW = UIColor(red: 244/255, green: 208/255, blue: 99/255, alpha: 1)
// red 236, 112, 99
let CUSTOM_RED = UIColor(red: 236/255, green: 112/255, blue: 99/255, alpha: 1)

let values: [CGFloat] = [250.0, 100.0, 350.0, 300.0]
let colors: [UIColor] = [CUSTOM_ORANGE, CUSTOM_GREEN, CUSTOM_BLUE, CUSTOM_RED]
let labels: [String] = ["Label 1", "Label 2", "Label 3", "Label 4"]

class ViewController: UIViewController {

    let barChart = E3BarChartView()
    let backView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setupBackView()
        setupBarChart()
        barChart.configure(isChartAnimated: true, chartAnimationSpeed: 1.0, barAnimationSpeed: 1.0)
        barChart.configure(withData: values, labels: labels, colors: colors)
    }
    
    public func setupBarChart() {
        self.view.addSubview(barChart)
        barChart.translatesAutoresizingMaskIntoConstraints = false
        barChart.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        barChart.backgroundColor = .red
        NSLayoutConstraint.activate([barChart.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
                                     barChart.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
                                     barChart.heightAnchor.constraint(equalToConstant: 300),
                                     barChart.widthAnchor.constraint(equalToConstant: 300)])

    }
    
    func setupBackView() {
        self.view.addSubview(backView)
        backView.backgroundColor = .green
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        print("ViewController: backView before layoutIfNeeded is \(backView.frame.width)")
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                     backView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                     backView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                                     backView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)])

        backView.layoutIfNeeded()
        print("ViewController: backView after layoutIfNeeded is \(backView.frame.width)")
    }
}

