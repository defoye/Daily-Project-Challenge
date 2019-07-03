//
//  UIViewExtensions.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/27/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

extension UIView {
	func instantiateBackView() {
		let waterMark = UITextView.constructDefaultTextView()
		let backView = UIView()
		backView.backgroundColor = .lightGray
		backView.addSubview(waterMark)
		waterMark.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([waterMark.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
									 waterMark.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
									 waterMark.heightAnchor.constraint(equalToConstant: 40),
									 waterMark.widthAnchor.constraint(equalToConstant: 80)])
	}
	
	func constrainSubViewToSafeArea(subView: UIView) {
		let safeLayout: UILayoutGuide = self.safeAreaLayoutGuide
		subView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([subView.topAnchor.constraint(equalTo: safeLayout.topAnchor),
									subView.bottomAnchor.constraint(equalTo: safeLayout.bottomAnchor),
									subView.leftAnchor.constraint(equalTo: safeLayout.leftAnchor),
									subView.rightAnchor.constraint(equalTo: safeLayout.rightAnchor)])
	}
}

extension UITextView {
	static func constructDefaultTextView() -> UITextView {
		let textView: UITextView = UITextView()
		textView.backgroundColor = .lightGray
		textView.isEditable = false
		textView.isSelectable = false
		textView.isScrollEnabled = false
		textView.isSecureTextEntry = false
		textView.font = UIFont.systemFont(ofSize: 14)
		textView.text = "Default UITextView"
		
		return textView 
	}
}

//extension Storyboarded where Self: UIViewController {
//	static func instantiate() -> Self {
//		// this pulls out "MyApp.MyViewController"
//		let fullName = NSStringFromClass(self)
//
//		// this splits by the dot and uses everything after, giving "MyViewController"
//		let className = fullName.components(separatedBy: ".")[1]
//
//		// load our storyboard
//		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//
//		// instantiate a view controller with that identifier, and force cast as the type that was requested
//		return storyboard.instantiateViewController(withIdentifier: className) as! Self
//	}
//}
