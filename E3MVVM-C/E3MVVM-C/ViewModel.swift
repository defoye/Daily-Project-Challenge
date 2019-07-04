//
//  ViewModel.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 7/1/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

public class DataManager: DataManaging {
	
}

public class TableViewModel: TableViewModeling {
	
	public func cellViewModelForRowAt<Model>(indexPath: IndexPath) -> Model {
		return sectionModels[indexPath.section].getState(row: indexPath.row)
	}
	
	public func cellIdentifierForSectionAt(section: Int) -> String {
		return sectionModels[section].cellIdentifier
	}
	
	public func numberOfSections() -> Int {
		return sectionModels.count
	}
	
	public func numberOfRowsForSection(section: Int) -> Int {
		return sectionModels[section].getNumberOfRows()
	}
	
	public required init(dataManager: DataManager) {
		self.dataManager = dataManager
		// What are the trade offs of not making this optional?
		self.sectionModels = []
	}
	private let dataManager: DataManager
	private var sectionModels: [TableViewSectionModeling]
}
