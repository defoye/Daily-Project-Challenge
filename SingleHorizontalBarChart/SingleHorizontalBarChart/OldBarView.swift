//
//  OldBarView.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/13/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class OldBarView: BaseView {
    
        let category1View = UIView()
        let category2View = UIView()
        let category3View = UIView()
        let category4View = UIView()
    
    let backView = UIView()
    
    override func setupViews() {
        addSubview(backView)
        addSubview(category1View)
        addSubview(category2View)
        addSubview(category3View)
        addSubview(category4View)
    }
    
    func configure(withValues values: [CGFloat], withColors colors: [UIColor]) {
        setupBackView()
        setupCategoryViews()
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
    
    
        func setupCategoryViews() {
            // NOTE: Since we are using Auto Layout, we need to reset the frames to calculate the view's width.
            self.layoutIfNeeded()
            let backViewWidth = backView.frame.width
    
            // IMPORTANT (in any programming language) force doubles to be doubles!!
            let total: CGFloat = 1000.0
            let category1Total: CGFloat = 250.0
            let category2Total: CGFloat = 100.0
            let category3Total: CGFloat = 350.0
            let category4Total: CGFloat = 300.0
    
            let category1Width = CGFloat((category1Total/total)*backViewWidth)
            let category2Width = CGFloat((category2Total/total)*backViewWidth)
            let category3Width = CGFloat((category3Total/total)*backViewWidth)
            let category4Width = CGFloat((category4Total/total)*backViewWidth)
    
            // NOTE: I am noticing what is possibly rounding error, sice the views look a few pixels short of the right anchor of the backView
    
            category1View.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            category1View.translatesAutoresizingMaskIntoConstraints = false
            category1View.backgroundColor = .red
            NSLayoutConstraint.activate([category1View.leftAnchor.constraint(equalTo: self.backView.leftAnchor, constant: 0),
                                         category1View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                         category1View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                         category1View.rightAnchor.constraint(equalTo: self.backView.leftAnchor, constant: category1Width)])
    
    
            category2View.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            category2View.translatesAutoresizingMaskIntoConstraints = false
            category2View.backgroundColor = .blue
            NSLayoutConstraint.activate([category2View.leftAnchor.constraint(equalTo: category1View.rightAnchor, constant: 0),
                                         category2View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                         category2View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                         category2View.rightAnchor.constraint(equalTo: category1View.rightAnchor, constant: category2Width)])
    
            category3View.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            category3View.translatesAutoresizingMaskIntoConstraints = false
            category3View.backgroundColor = .green
            NSLayoutConstraint.activate([category3View.leftAnchor.constraint(equalTo: category2View.rightAnchor, constant: 0),
                                         category3View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                         category3View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                         category3View.rightAnchor.constraint(equalTo: category2View.rightAnchor, constant: category3Width)])
    
    
            category4View.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            category4View.translatesAutoresizingMaskIntoConstraints = false
            category4View.backgroundColor = .orange
    
            NSLayoutConstraint.activate([category4View.leftAnchor.constraint(equalTo: category3View.rightAnchor, constant: 0),
                                         category4View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                         category4View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                         category4View.rightAnchor.constraint(equalTo: category3View.rightAnchor, constant: category4Width)])
    
            UIView.animate(withDuration: 2.0) {
                self.layoutIfNeeded()
            }
        }
}



//class BaseView: UIView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupViews() {
//        
//    }
//}

