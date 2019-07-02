//
//  CellViewModels.swift
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
public protocol TableSectionViewModeling {
//	var headerIdentifier: String { get }
	var cellIdentifier: String { get }
//	var footerIdentifier: String { get }
	var action: CellAction? { get }
	var didSelectCellAction: DidSelectCellAction? { get }
	var height: CGFloat { get }
	
//	func getState<Model>() -> Model
//	associatedtype HeabderModel
	associatedtype CellModel
//	associatedtype FooterModel

//	func getCellState() -> HeaderModel
	func getCellState() -> CellModel
//	func getCellState() -> FooterModel

	init(identifier: String, action: CellAction?, height: CGFloat)
}

public struct RedSectionViewModel: TableSectionViewModeling {
	public func getCellState() -> RedCellViewData {
		return RedCellViewData(backgroundColor: .red)
	}
	
	public typealias CellModel = RedCellViewData
//	public func getState() -> RedCellViewData {
//		return RedCellViewData(backgroundColor: .red)
//	}
//	public func getState() -> RedCellViewData {
//		return RedCellViewData(backgroundColor: .red)
//	}
	
	public init(identifier: String, action: CellAction?, height: CGFloat) {
		self.cellIdentifier = "ff"
		self.action = nil
		self.height = height
	}
	
	public typealias Model = RedCellViewData
	
	public var cellIdentifier: String
	
	public var action: CellAction?
	
	public var didSelectCellAction: DidSelectCellAction?
	
	public var height: CGFloat

}
