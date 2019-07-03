//
//  StockPlotCell.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/27/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
}

class StockPlotCell: UITableViewCell, TableViewCellProtocol {
	
	var customView = E3StockPlot()
	
	func configure<ViewDataModel>(withViewData: ViewDataModel) {
		guard let viewData = withViewData as? E3StockPlotViewData else {
			fatalError("Wrong type sent to StockPlotCell")
		}

		self.contentView.addSubview(customView)
		backgroundColor = .clear
		setupCustomView()
		customView.configure(withViewData: viewData.points, fillColor: nil, graphLineWidth: 1.0, suffixPercentCutOff: 80)
		self.contentView.setNeedsDisplay()
		print("ConfiguredCustomView")
	}
	
	func setupCustomView() {
		print("Configure custom view\n")
		customView.backgroundColor = .blue
		customView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		customView.translatesAutoresizingMaskIntoConstraints = false
		let back = self.contentView
		NSLayoutConstraint.activate([customView.topAnchor.constraint(equalTo: back.topAnchor),
									 customView.bottomAnchor.constraint(equalTo: back.bottomAnchor),
									 customView.leftAnchor.constraint(equalTo: back.leftAnchor),
									 customView.rightAnchor.constraint(equalTo: back.rightAnchor)])
	}
}
