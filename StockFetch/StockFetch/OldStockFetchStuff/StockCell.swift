//
//  StockCell.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//
//
//import UIKit
//
//class StockCell: UITableViewCell {
//    
//    let textView: UITextView = {
//        let view = UITextView()
//        view.backgroundColor = .clear
//        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.text = "Text"
//        view.isEditable = false
//        view.isScrollEnabled = false
//        view.textColor = .white
//        view.font = UIFont.systemFont(ofSize: 14)
//        return view
//    }()
//    
//    func configure(name: String) {
//        backgroundColor = contentView.backgroundColor
//        addSubview(textView)
//        
//        textView.text = name
//        
//        NSLayoutConstraint.activate([textView.topAnchor.constraint(equalTo: contentView.topAnchor),
//                                     textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//                                     textView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//                                     textView.rightAnchor.constraint(equalTo: contentView.rightAnchor)])
//    }
//}
