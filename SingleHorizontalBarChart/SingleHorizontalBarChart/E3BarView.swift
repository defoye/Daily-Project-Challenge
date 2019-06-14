//
//  E3BarView.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/12/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class E3BarView: UIView {

    public var barBackgroundColor: UIColor = .clear
    public var isAnimated: Bool = true
    public var barAnimationSpeed: Double = 2.0
    private let backView = UIView()
    
    // MARK: Public methods
    
    public func configure(withValues values: [CGFloat], withColors colors: [UIColor]) {
        setupBackView()
        setupCategoryViews(values: values, colors: colors)
    }
}

extension E3BarView {
    
    // MARK: Private methods
    
    private func setupCategoryViews(values: [CGFloat], colors: [UIColor]) {
        self.layoutIfNeeded()
        let length = self.backView.frame.width
        let weights = E3BarChartView.computeWeightedLengths(values: values, length: length)
        var tuples: [(CGFloat, UIColor)] = []
        // so pretty :)
        tuples = Array(zip(weights,colors))
        
        setupCategoryViewConstraints(withTraits: tuples)
    }
    
    // Remember to pre compute widths
    private func setupCategoryViewConstraints(withTraits traits: [(width: CGFloat, color: UIColor)]) {
        
        var prevAnchor: NSLayoutAnchor = self.backView.leftAnchor
        
        for trait in traits {
            let category = createCategoryView(withColor: trait.color)
            // Adding the rightAnchor last makes animation stretch out.
            NSLayoutConstraint.activate([category.leftAnchor.constraint(equalTo: prevAnchor),
                                         category.topAnchor.constraint(equalTo: self.backView.topAnchor),
                                         category.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor),
                                         category.rightAnchor.constraint(equalTo: prevAnchor, constant: trait.width)])
            
            prevAnchor = category.rightAnchor
        }
        
        if isAnimated {
            UIView.animate(withDuration: barAnimationSpeed) {
                self.layoutIfNeeded()
            }
        }
    }
    
    private func createCategoryView(withColor color: UIColor) -> UIView {
        let categoryView = UIView()
        self.addSubview(categoryView)
        categoryView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.backgroundColor = color
        
        return categoryView
    }
    
    // backView
    private func setupBackView() {
        addSubview(backView)
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = barBackgroundColor
        
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                                     backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
                                     backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
}


