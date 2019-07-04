//
//  ViewController.swift
//  TryWebView
//
//  Created by Ernest DeFoy on 6/24/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
	
	let webView = WKWebView()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		view.addSubview(webView)
		webView.translatesAutoresizingMaskIntoConstraints = false
		let safe = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([webView.topAnchor.constraint(equalTo: safe.topAnchor),
			webView.heightAnchor.constraint(equalTo: safe.heightAnchor, multiplier: 0.5),
			webView.leftAnchor.constraint(equalTo: safe.leftAnchor),
			webView.rightAnchor.constraint(equalTo: safe.rightAnchor)])
//		let attributes: [NSLayoutConstraint.Attribute] = [.centerX, .centerY, .width, .height]
//		NSLayoutConstraint.activate(attributes.map {NSLayoutConstraint(item: webView, attribute: $0, relatedBy: .equal, toItem: webView.superview, attribute: $0, multiplier: 1, constant: 0) })
		let url = URL(string: "https://www.leetcode.com")!
		let urlRequest = URLRequest(url: url)
		webView.load(urlRequest)

	}


}

