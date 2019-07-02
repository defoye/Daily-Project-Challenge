//
//  GreenSectionViewModel.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 7/1/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

// MARK:- Green Section View Model

public class GreenSectionViewModel: TableViewSectionModeling {
	public func getNumberOfRows() -> Int {
		return self.viewDataModels.count
	}
	
	public func getState<ViewDataModel>(row: Int) -> ViewDataModel {
		// type erasure
		return self.viewDataModels[row] as! ViewDataModel
	}
	
	public func getState(row: Int) -> ModelType {
		// type erasure
		return self.viewDataModels[row]
	}
	
	public required init<ViewDataModel>(identifier: String, height: Double, viewDataModel: [ViewDataModel]) {
		self.cellIdentifier = identifier
		self.height = height
		guard let data = viewDataModel as? [GreenCellViewData] else { fatalError("Wrong type sent to GreenSection") }
		self.viewDataModels = data
	}
	
	
	public var cellIdentifier: String
	public var height: Double
	private var viewDataModels: [GreenCellViewData]
}
