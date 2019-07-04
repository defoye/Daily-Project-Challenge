//
//  Protocols.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 7/1/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol TableViewCellViewDataProtocol {

}

public protocol TableViewCellProtocol {
	func configure<ViewDataModel>(model: ViewDataModel)
}

public protocol SelectableTableViewCellProtocol {
	var delegate: UITableViewController { get set }
	var selector: (() -> Void)? { get }
}

public protocol TableViewSectionModeling {
	var cellIdentifier: String { get }
	var height: Double { get }
	
	func getNumberOfRows() -> Int

	func getState<ViewDataModel>(row: Int) -> ViewDataModel
	init<ViewDataModel>(identifier: String, height: Double, viewDataModel: [ViewDataModel])
}

public protocol ModelType {
	
}

public protocol DataManaging {
	
}

public protocol TableViewModeling {
	func cellIdentifierForSectionAt(section: Int) -> String
	func cellViewModelForRowAt(indexPath: IndexPath) -> ModelType
	func numberOfSections() -> Int
	func numberOfRowsForSection(section: Int) -> Int
	func heightForRowAt(indexPath: IndexPath) -> CGFloat
}
