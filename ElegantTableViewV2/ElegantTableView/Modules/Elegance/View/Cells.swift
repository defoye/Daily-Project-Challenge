//
//  Cells.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 6/30/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

// MARK:- Red Type

public struct RedCellViewData: ModelType {
	let backgroundColor: UIColor
	init(backgroundColor: UIColor) {
		self.backgroundColor = backgroundColor
	}
}

public class RedCell: UITableViewCell, TableViewCellProtocol {
	public func configure<ViewDataModel>(model: ViewDataModel) {
		guard let viewDataModel = model as? RedCellViewData else {
			print("Wrong data type")
			return
		}
		
		backgroundColor = viewDataModel.backgroundColor
	}
}

// MARK:- Green Type

public struct GreenCellViewData: ModelType {
	let backgroundColor: UIColor
	init(backgroundColor: UIColor) {
		self.backgroundColor = backgroundColor
	}
}

public class GreenCell: UITableViewCell, TableViewCellProtocol {
	public func configure<ViewDataModel>(model: ViewDataModel) {
		guard let viewDataModel = model as? GreenCellViewData else {
			print("Wrong data type")
			return
		}
		
		backgroundColor = viewDataModel.backgroundColor
	}
}

// MARK:- Blue Type

public struct BlueCellViewData: ModelType {
	let backgroundColor: UIColor
	init(backgroundColor: UIColor) {
		self.backgroundColor = backgroundColor
	}
}

public class BlueCell: UITableViewCell, TableViewCellProtocol {
	public func configure<ViewDataModel>(model: ViewDataModel) {
		guard let viewDataModel = model as? BlueCellViewData else {
			print("Wrong data type")
			return
		}
		
		backgroundColor = viewDataModel.backgroundColor
	}
}
