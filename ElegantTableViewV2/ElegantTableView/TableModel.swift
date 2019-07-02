//
//  TableModel.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 6/30/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit


// The TableViewModel is the true UITableViewDataSource.  At this point, the protocols are
// very restrictive and I think it's okay to import UIKit.
public protocol TableViewModeling {
//	var cellTypeMap: [AnyHashable : UITableViewCell.Type] { get }
	
//	func cellTypeForRowAt(indexPath: IndexPath) -> String
//	func cellIdentifierForRowAt(indexPath: IndexPath) -> String
	func numberOfSections() -> Int
	func numberOfRowsInSection(section: Int) -> Int
	func cellViewModelForRowAt<Model>(indexPath: IndexPath) -> Model

	func setCellDelegate(viewController: UITableViewController)
	func didSelectCellForRowAt(indexPath: IndexPath)
//	associatedtype Model
//	func getStateForRowAt(indexPath: IndexPath) -> Model
}

public class TableViewModelExample: TableViewModeling {
	public typealias Model = Sec
	
//	public var cellTypeMap: [AnyHashable : UITableViewCell.Type]
	
	
//	public enum SectionType: String {
//		case RedCellIdentifier
//		case GreenCellIdentifier
//		case BlueCellIdentifier
//	}
//
//	public func cellIdentifierForRowAt(indexPath: IndexPath) -> String {
//		let section = indexPath.section
//	}
	
	public func getStateForRowAt(indexPath: IndexPath) -> Model {
		return cellViewModels[indexPath.section][indexPath.row].getState()
	}
	

	
//	public var cellTypeMap: [AnyHashable : UITableViewCell.Type] = [:]
	private var cellViewModels = [TableSectionViewModeling]()
	
	public init() {
		let array: [CellViewModeling] = []
		CellViewModeling
		cellViewModels.append()
	}
	

	
	public func setCellDelegate(viewController: UITableViewController) {
		//
	}
	
	public func numberOfSections() -> Int {
		return cellViewModels.count
	}
	
	public func numberOfRowsInSection(section: Int) -> Int {
		return cellViewModels[section].count
	}
	
	private func didSelectRedCell() {
		// TODO: RedCell action.
		print("Red Cell action")
	}
	
	private func didSelectGreenCell() {
		// TODO: GreenCell action.
	}
	
	private func didSelectBlueCell() {
		// TODO: BlueCell action.
	}
}

extension TableViewModelExample {
//	public func cellTypeForRowAt(indexPath: IndexPath) -> String {
//		return cellViewModels[indexPath.section][indexPath.row].cellIdentifier
//	}
	
	private func cellActionForRowAt(indexPath: IndexPath) {
		cellViewModels[indexPath.section][indexPath.row].action
	}
	
	public func didSelectCellForRowAt(indexPath: IndexPath) {
		cellViewModels[indexPath.section][indexPath.row].didSelectCellAction
	}
	
	public func cellViewModelForRowAt<Model>(indexPath: IndexPath) -> Model {
		return cellViewModels[indexPath.section][indexPath.row].getState()
	}
}
