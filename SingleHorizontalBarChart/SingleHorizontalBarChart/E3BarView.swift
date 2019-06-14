//
//  E3BarView.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/12/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class E3BarView: UIView {

    let backView = UIView()
    
    // MARK: Public methods
    
    public func configure(withValues values: [CGFloat], withColors colors: [UIColor]) {
        setupBackView()
        //setupSeparatorViews()
        setupCategoryViews(values: values, colors: colors)
    }
}

extension E3BarView {
    
    // MARK: Private methods
    
    private func setupCategoryViews(values: [CGFloat], colors: [UIColor]) {
        // lambdas <3
        let total: CGFloat = values.reduce(0, +)
        let weights = computeWidthWeights(values: values, total: total)
        var tuples: [(CGFloat, UIColor)] = []
        // so pretty :)
        tuples = Array(zip(weights,colors))
        
        setupCategoryViewConstraints(withTraits: tuples)
    }
    
    // TODO: computeWidthWeights is deprecated!!
    /**
     May look to combine with function I am about to write to compute height weights. I just don't want to make a utility function 
    */
    private func computeWidthWeights(values: [CGFloat], total: CGFloat) -> [CGFloat] {
        // Reset backView frame width
        self.layoutIfNeeded()
        let areaWidth = self.backView.frame.width
        var weights: [CGFloat] = []
        
        for value in values {
            weights.append((value/total) * areaWidth)
        }
        
        return weights
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
        
        UIView.animate(withDuration: 2.0) {
            self.layoutIfNeeded()
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
        backView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                                     backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
                                     backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
}


