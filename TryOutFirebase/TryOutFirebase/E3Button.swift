//
//  E3Button.swift
//  TryOutFirebase
//
//  Created by Ernest DeFoy on 6/24/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class BaseView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setup() {
		
	}
}

class E3Button: BaseView {

	let textView = UITextView()
	let button = UIButton()
	
	override func setup() {
		self.addSubview(textView)
		self.addSubview(button)
		configureTextView()
		configureButton()
	}
	
	func configureButton() {
		
	}
	
	func configureTextView() {
		
	}
}
