//
//  ViewController.swift
//  TryOutFirebase
//
//  Created by Ernest DeFoy on 6/23/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

	var setDocumentButton: UIButton = UIButton()
	var setDocumentButtonTitleView: UITextView = UITextView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		view.addSubview(setDocumentButton)
//		setDocumentButton.set
		setDocumentButton.tintColor = .blue
		setDocumentButton.setTitle("Set Document", for: .normal)
		setDocumentButton.titleLabel?.minimumScaleFactor = 0.5
		setDocumentButton.titleLabel?.numberOfLines = 0
		setDocumentButton.titleLabel?.adjustsFontSizeToFitWidth = true
		setDocumentButton.frame = CGRect(x: 0, y: 0, width: setDocumentButton.intrinsicContentSize.height, height: setDocumentButton.intrinsicContentSize.width)
		setDocumentButton.addTarget(self, action: #selector(self.setDocumentButtonPressed(_:)), for: .touchUpInside) //<- use `#selector(...)`

	}
	
//	func createLabeledButton(font: UIFont, text: String, button: UIButton) -> UIButton {
//		
//		setDocumentButtonTitleView.translatesAutoresizingMaskIntoConstraints = false
//		setDocumentButtonTitleView.text = "Set Document"
//		setDocumentButtonTitleView.isScrollEnabled = false
//		setDocumentButtonTitleView.sizeToFit()
//	}

	@objc func setDocumentButtonPressed(_ sender: Any) {
		print("Set Document")
		
		// Add a new document in collection "cities"
		db.collection("cities").document("LA").setData([
			"name": "Los Angeles",
			"state": "CA",
			"country": "USA"
		]) { err in
			if let err = err {
				print("Error writing document: \(err)")
			} else {
				print("Document successfully written!")
			}
		}

	}
	
}

