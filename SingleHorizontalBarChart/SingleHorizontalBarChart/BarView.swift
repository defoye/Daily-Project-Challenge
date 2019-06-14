//
//  BarView.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/12/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class BarView: BaseView {

    let backView = UIView()
    
    override func setupViews() {
        addSubview(backView)
    }
    
    func configure(withValues values: [CGFloat], withColors colors: [UIColor]) {
        setupBackView()
        //setupSeparatorViews()
        setupCategoryViews(values: values, colors: colors)
    }
    
    func setupBackView() {
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .white

        print("BarView: backView before layoutIfNeeded is \(backView.frame.width)")
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                                     backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
                                     backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
        self.layoutIfNeeded()
        print("BarView: backView after layoutIfNeeded is \(backView.frame.width)")
    }
}

extension BarView {
    
    // MARK: Public methods
    
    public func setupCategoryViews(values: [CGFloat], colors: [UIColor]) {
        // lambdas <3
        let total: CGFloat = values.reduce(0, +)
        let weights = computeWidthWeights(values: values, total: total)
        var tuples: [(CGFloat, UIColor)] = []
        // so pretty :)
        tuples = Array(zip(weights,colors))
        
        setupCategoryViewConstraints(withTraits: tuples)
    }
}

extension BarView {
    
    // MARK: Private methods
    
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
            print("trait")
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
    
    private func createCategoryViewArray(withColors colors: [UIColor]) -> [UIView] {
        var categoryViews = [UIView]()
        
        for color in colors {
            categoryViews.append(createCategoryView(withColor: color))
        }
        
        return categoryViews
    }
    
    private func createCategoryView(withColor color: UIColor) -> UIView {
        let categoryView = UIView()
        self.addSubview(categoryView)
        categoryView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.backgroundColor = color
        
        return categoryView
    }
}

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
