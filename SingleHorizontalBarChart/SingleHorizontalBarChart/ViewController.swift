//
//  ViewController.swift
//  SingleHorizontalBarChart
//
//  Created by Ernest DeFoy on 6/12/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let barView = BarView()
    
    let backView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupBackView()
        setupBarView()
    }
    
    func setupBackView() {
        self.view.addSubview(backView)
        backView.backgroundColor = .green
        backView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 1),
                                     backView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -1),
                                     backView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 1),
                                     backView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -1)])
        
        backView.sizeToFit()
    }

    func setupBarView() {
        self.view.addSubview(barView)
        barView.backgroundColor = .white
        barView.frame = CGRect(x: 0, y: 0, width: self.backView.frame.width, height: 100)
        barView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([barView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor, constant: 0),
                                     barView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor, constant: 0),
                                     barView.heightAnchor.constraint(equalToConstant: 100),
                                     barView.widthAnchor.constraint(equalTo: self.backView.widthAnchor, constant: 0)])
        print(self.view.frame.width)
        print(UIScreen.main.bounds.width)
    }
}

