//
//  E3BarChartView.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/13/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class E3BarChartView: UIView {
    
    public var chartBackGroundColor: UIColor = .clear
    public var chartCornerRadius: CGFloat = 8.0
    public var chartTextColor: UIColor = .black
    public var chartAnimationSpeed: Double = 10.0
    public var barAnimationSpeed: Double = 10.0
    public var isChartAnimated: Bool = true
    public var isBarViewAnimated: Bool = true
    
    private let backView = UIView()
    private let barView = E3BarView()
    
    public func configure(isChartAnimated: Bool, chartAnimationSpeed: Double, barAnimationSpeed: Double) {
        self.isChartAnimated = isChartAnimated
        self.isBarViewAnimated = isChartAnimated
        self.chartAnimationSpeed = chartAnimationSpeed
        self.barAnimationSpeed = barAnimationSpeed
    }
    
    public func configure(withData values: [CGFloat], labels: [String], colors: [UIColor]) {
        setupBackView()
        setupBarView()
        
        barView.isAnimated = isBarViewAnimated
        barView.barAnimationSpeed = barAnimationSpeed
        barView.configure(withValues: values, withColors: colors)
        
        let coloredLabels = Array(zip(labels,colors))

        // Remember to reset frames
        self.layoutIfNeeded()
        let equalHeight = CGFloat((self.backView.frame.height - self.barView.frame.height) / CGFloat(colors.count))
        setupCategoryCategoryTextViewConstraints(withHeight: equalHeight, coloredLabels: coloredLabels)
    }
    
}

extension E3BarChartView {
    
    // MARK: Private Methods
    
    // Remember to pre compute widths
    private func setupCategoryCategoryTextViewConstraints(withHeight height: CGFloat, coloredLabels: [(String,UIColor)]) {
        
        var prevAnchor: NSLayoutAnchor = self.barView.bottomAnchor
        let blockInset: CGFloat = 5
        
        for trait in coloredLabels {
            let back = createBackView(withColor: chartBackGroundColor)
            NSLayoutConstraint.activate([back.topAnchor.constraint(equalTo: prevAnchor),
                                         back.leftAnchor.constraint(equalTo: backView.leftAnchor),
                                         back.bottomAnchor.constraint(equalTo: prevAnchor, constant: height),
                                         back.rightAnchor.constraint(equalTo: backView.rightAnchor)])
            let textView = createCategoryTextView(withColor: chartBackGroundColor, text: trait.0)

            // Adding the rightAnchor last makes animation stretch out.
            NSLayoutConstraint.activate([textView.topAnchor.constraint(equalTo: prevAnchor),
                                         textView.leftAnchor.constraint(equalTo: back.leftAnchor, constant: height),
                                         textView.bottomAnchor.constraint(equalTo: prevAnchor, constant: height),
                                         textView.rightAnchor.constraint(equalTo: backView.rightAnchor)])
            let colorBlock = createBackView(withColor: trait.1)
            colorBlock.layer.cornerRadius = chartCornerRadius
            NSLayoutConstraint.activate([colorBlock.topAnchor.constraint(equalTo: back.topAnchor, constant: blockInset),
                                         colorBlock.leftAnchor.constraint(equalTo: back.leftAnchor, constant: blockInset),
                                         colorBlock.bottomAnchor.constraint(equalTo: back.bottomAnchor, constant: -blockInset),
                                         colorBlock.rightAnchor.constraint(equalTo: textView.leftAnchor, constant: -blockInset)])
            prevAnchor = textView.bottomAnchor
        }
        
        if isBarViewAnimated {
            UIView.animate(withDuration: chartAnimationSpeed) {
                self.layoutIfNeeded()
            }
        }
    }
    
    private func createCategoryTextView(withColor color: UIColor, text: String) -> UIView {
        let categoryTextView = UITextView()
        self.addSubview(categoryTextView)
        categoryTextView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        categoryTextView.translatesAutoresizingMaskIntoConstraints = false
        categoryTextView.backgroundColor = color
        categoryTextView.isEditable = false
        categoryTextView.isScrollEnabled = false
        categoryTextView.textColor = .white
        categoryTextView.text = text
        categoryTextView.textColor = chartTextColor

        return categoryTextView
    }
}

extension E3BarChartView {
    
    // MARK: Setup funcions for the backView and barView
    
    private func setupBackView() {
        self.addSubview(backView)
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = chartBackGroundColor
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.topAnchor),
                                     backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     backView.leftAnchor.constraint(equalTo: self.leftAnchor),
                                     backView.rightAnchor.constraint(equalTo: self.rightAnchor)])
    }
    
    private func setupBarView() {
        self.addSubview(barView)
        barView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.backgroundColor = chartBackGroundColor
        barView.layer.cornerRadius = chartCornerRadius
        barView.clipsToBounds = true
        NSLayoutConstraint.activate([barView.topAnchor.constraint(equalTo: self.topAnchor),
                                     barView.leftAnchor.constraint(equalTo: self.leftAnchor),
                                     barView.rightAnchor.constraint(equalTo: self.rightAnchor),
                                     barView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.25)])
    }
}

extension E3BarChartView {
    
    // MARK: Utilities
    
    static func computeWeightedLengths(values: [CGFloat], length: CGFloat) -> [CGFloat] {
        // lambdas <3
        let total: CGFloat = values.reduce(0, +)
        var weights: [CGFloat] = []
        
        for value in values {
            weights.append((value/total) * length)
        }
        
        return weights
    }
    
    private func createBackView(withColor color: UIColor) -> UIView {
        let backView = UIView()
        self.addSubview(backView)
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = color
        
        return backView
    }
    
//    public func computeEqualHeight(total: CGFloat, parentView: UIView) -> CGFloat {
//        // Reset backView frame width
//        parentView.layoutIfNeeded()
//        let areaHeight = self.backView.frame.height - self.barView.frame.height
//
//        return (total * areaHeight)
//    }
}
