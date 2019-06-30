//
//  TableModel.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 6/30/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit


// Delegate is the ViewModel
public typealias CellAction = () -> ()
// Delegate is the TableViewController
public typealias DidSelectCellAction = (_ sender: UITableViewCell) -> ()

// Should be a light class.
public protocol CellViewModeling {
	var cellIdentifier: String { get }
	var action: CellAction? { get }
	var didSelectCellAction: DidSelectCellAction? { get }
	var height: CGFloat { get }

	func getState<Model>() -> Model
	
	init(identifier: String, action: CellAction?)
}

// The TableViewModel is the true UITableViewDataSource.  At this point, the protocols are
// very restrictive and I think it's okay to import UIKit.
public protocol TableViewModeling {
	var cellTypeMap: [AnyHashable : UITableViewCell.Type] { get }
	
	func cellTypeForRowAt(indexPath: IndexPath) -> String
	func numberOfSections() -> Int
	func numberOfRowsInSection(section: Int) -> Int
	func cellViewModelForRowAt<Model>(indexPath: IndexPath) -> Model

	func setCellDelegate(viewController: UITableViewController)
	func didSelectCellForRowAt(indexPath: IndexPath)
	
	func getStateForRowAt<Model>(indexPath: IndexPath) -> Model
}

public class TableViewModelExample: TableViewModeling {
	public func getStateForRowAt<Model>(indexPath: IndexPath) -> Model {
		return cellViewModels[indexPath.section][indexPath.row].getState()
	}
	

	
	public var cellTypeMap: [AnyHashable : UITableViewCell.Type] = [:]
	private var cellViewModels = [[CellViewModeling]]()
	
	public init() {
		enum CellType: String {
			case RedCellIdentifier
			case GreenCellIdentifier
			case BlueCellIdentifier
		}
		
		cellTypeMap[CellType.RedCellIdentifier] = RedCell.self
		cellTypeMap[CellType.GreenCellIdentifier] = GreenCell.self
		cellTypeMap[CellType.BlueCellIdentifier] = BlueCell.self
	}
	

	
	public func setCellDelegate(viewController: UITableViewController) {
		//
	}
	
	public func numberOfSections() -> Int {
		return 1
	}
	
	public func numberOfRowsInSection(section: Int) -> Int {
		return 3
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
	public func cellTypeForRowAt(indexPath: IndexPath) -> String {
		return cellViewModels[indexPath.section][indexPath.row].cellIdentifier
	}
	
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
