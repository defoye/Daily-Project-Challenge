//
//  BarView.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/12/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class BarView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let category1View = UIView()
    let category2View = UIView()
    let category3View = UIView()
    let category4View = UIView()
    
    let separator1 = UIView()
    let separator2 = UIView()
    let separator3 = UIView()

    let backView = UIView()

//    func configure(withData array: [Int]) {
//        addViews();
//    }
    
    override func setupViews() {
        addSubview(backView)
        
        setupBackView()
        //setupSeparatorViews()
        setupCategoryViews()
    }
    
    func setupBackView() {
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .black
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                                     backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                                     backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
                                     backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)])
    }
    
    func setupCategoryViews() {
        let viewWidth = self.frame.width
        // TODO: Just get this right.
        backView.sizeToFit()
        let backViewWidth = backView.frame.width
        let total: CGFloat = 1000.0
        
        let category1Total: CGFloat = 250
        let category2Total: CGFloat = 100
        let category3Total: CGFloat = 350
        let category4Total: CGFloat = 300
        
        let category1Percent = CGFloat(category1Total/total)
        let category2Percent = CGFloat(category2Total/total)
        let category3Percent = CGFloat(category3Total/total)
        let category4Percent = CGFloat(category4Total/total)
        
        let category1Width = -1.0 + category1Percent*backViewWidth
        let category2Width = -1.0 + category2Percent*backViewWidth
        let category3Width = -1.0 + category3Percent*backViewWidth
        let category4Width = -1.0 + category4Percent*backViewWidth

        
        addSubview(category1View)
        category1View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
        category1View.translatesAutoresizingMaskIntoConstraints = false
        category1View.backgroundColor = .white
        NSLayoutConstraint.activate([category1View.leftAnchor.constraint(equalTo: self.backView.leftAnchor, constant: 0),
                                     category1View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                     category1View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                     category1View.rightAnchor.constraint(equalTo: self.backView.leftAnchor, constant: 100)])
        
        addSubview(category2View)
        category2View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
        category2View.translatesAutoresizingMaskIntoConstraints = false
        category2View.backgroundColor = .red
        NSLayoutConstraint.activate([category2View.leftAnchor.constraint(equalTo: category1View.rightAnchor, constant: 0),
                                     category2View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                     category2View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                     category2View.rightAnchor.constraint(equalTo: category1View.rightAnchor, constant: 50)])
        addSubview(category3View)
        category3View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
        category3View.translatesAutoresizingMaskIntoConstraints = false
        category3View.backgroundColor = .purple
        NSLayoutConstraint.activate([category3View.leftAnchor.constraint(equalTo: category2View.rightAnchor, constant: 0),
                                     category3View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                     category3View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                     category3View.rightAnchor.constraint(equalTo: category2View.rightAnchor, constant: 75)])
        addSubview(category4View)
        category4View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
        category4View.translatesAutoresizingMaskIntoConstraints = false
        category4View.backgroundColor = .orange
        
        NSLayoutConstraint.activate([category4View.leftAnchor.constraint(equalTo: category3View.rightAnchor, constant: 0),
                                     category4View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
                                     category4View.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: 0),
                                     category4View.rightAnchor.constraint(equalTo: category3View.rightAnchor, constant: 75)])
        
        UIView.animate(withDuration: 5.0) {
            self.category1View.layoutIfNeeded()
            self.category2View.layoutIfNeeded()
            self.category3View.layoutIfNeeded()
            self.category4View.layoutIfNeeded()
        }
    }
//    func setupCategoryViews() {
//        let viewWidth = self.frame.width
//
//        let category1Percent = 0.2
//        let category2Percent = 0.4
//        let category3Percent = 0.1
//        let category4Percent = 0.3
//
//        addSubview(category1View)
//        category1View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
//        category1View.translatesAutoresizingMaskIntoConstraints = false
//        category1View.backgroundColor = .white
//        NSLayoutConstraint.activate([category1View.widthAnchor.constraint(equalToConstant: 100),
//                                     category1View.heightAnchor.constraint(equalToConstant: 100),
//                                     category1View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
//                                     category1View.leftAnchor.constraint(equalTo: self.backView.leftAnchor, constant: 0)])
//
//        addSubview(category2View)
//        category2View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
//        category2View.translatesAutoresizingMaskIntoConstraints = false
//        category2View.backgroundColor = .red
//        NSLayoutConstraint.activate([category2View.widthAnchor.constraint(equalToConstant: 75),
//                                     category2View.heightAnchor.constraint(equalTo: self.backView.heightAnchor, multiplier: 1),
//                                     category2View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
//                                     category2View.leftAnchor.constraint(equalTo: self.category1View.rightAnchor, constant: 0)])
//        addSubview(category3View)
//        category3View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
//        category3View.translatesAutoresizingMaskIntoConstraints = false
//        category3View.backgroundColor = .purple
//        NSLayoutConstraint.activate([category3View.widthAnchor.constraint(equalToConstant: 150),
//                                     category3View.heightAnchor.constraint(equalTo: self.backView.heightAnchor, multiplier: 1),
//                                     category3View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
//                                     category3View.leftAnchor.constraint(equalTo: self.category2View.rightAnchor, constant: 0)])
//        addSubview(category4View)
//        category4View.frame = CGRect(x: 0, y: 0, width: viewWidth*CGFloat(category1Percent), height: 100)
//        category4View.translatesAutoresizingMaskIntoConstraints = false
//        category4View.backgroundColor = .orange
//        NSLayoutConstraint.activate([category4View.widthAnchor.constraint(equalToConstant: 15),
//                                     category4View.heightAnchor.constraint(equalTo: self.backView.heightAnchor, multiplier: 1),
//                                     category4View.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 0),
//                                     category4View.leftAnchor.constraint(equalTo: self.category3View.rightAnchor, constant: 0)])
//
//        UIView.animate(withDuration: 5.0) {
//            self.category1View.layoutIfNeeded()
//            self.category1View.layoutIfNeeded()
//            self.category1View.layoutIfNeeded()
//            self.category1View.layoutIfNeeded()
//
//        }
//    }
    
    func setupSeparatorViews() {
        addSubview(separator1)
        addSubview(separator2)
        addSubview(separator3)
        
        separator1.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        separator1.translatesAutoresizingMaskIntoConstraints = false
        separator1.backgroundColor = .white
        NSLayoutConstraint.activate([separator1.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor, constant: 0),
                                     separator1.heightAnchor.constraint(equalTo: self.backView.heightAnchor, constant: 0),
                                     separator1.widthAnchor.constraint(equalToConstant: 1),
                                     separator1.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor, constant: 0)])
        separator2.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        separator2.translatesAutoresizingMaskIntoConstraints = false
        separator2.backgroundColor = .white
        NSLayoutConstraint.activate([separator2.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor, constant: 0),
                                     separator2.heightAnchor.constraint(equalTo: self.backView.heightAnchor, constant: 0),
                                     separator2.widthAnchor.constraint(equalToConstant: 1),
                                     separator2.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor, constant: 0)])
        separator3.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        separator3.translatesAutoresizingMaskIntoConstraints = false
        separator3.backgroundColor = .white
        NSLayoutConstraint.activate([separator3.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor, constant: 0),
                                     separator3.heightAnchor.constraint(equalTo: self.backView.heightAnchor, constant: 0),
                                     separator3.widthAnchor.constraint(equalToConstant: 1),
                                     separator3.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor, constant: 0)])
        
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
