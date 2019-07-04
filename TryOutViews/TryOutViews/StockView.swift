//
//  StockView.swift
//  TryOutViews
//
//  Created by Ernest DeFoy on 6/23/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class StockView: UITableView {

	let backViewForStock: UIView = {
		let view = UIView()
		return view
	}()
	
	
}

class StockChartCell: UITableViewCell {
	
}

extension UIView {
	func setConstraints(toSafeAreaOf backgroundView: UIView, forView foregroundView: UIView) {
		let safeAreaGuide = backgroundView.safeAreaLayoutGuide
		NSLayoutConstraint.activate([foregroundView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
									foregroundView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
									foregroundView.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
									foregroundView.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor)])
	}
}
