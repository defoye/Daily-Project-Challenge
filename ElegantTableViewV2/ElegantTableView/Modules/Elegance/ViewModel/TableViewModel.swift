//
//  TableViewModel.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 7/1/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public class DataManager: DataManaging {
	
}

public class TableViewModel: TableViewModeling {
	public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
		// TODO make a getHeight for row
		return CGFloat(sectionModels[indexPath.section].height)
	}
	
	
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
		
		
		//TODO
		enum SectionType: Int, CaseIterable {
			case RedSection
			case GreenSection
			case BlueSection
		}
		let redViewDataModels: [RedCellViewData] = [RedCellViewData(backgroundColor: .red), RedCellViewData(backgroundColor: .red)]
		let greenViewDataModels: [GreenCellViewData] = [GreenCellViewData(backgroundColor: .green), GreenCellViewData(backgroundColor: .green)]
		let blueViewDataModels: [BlueCellViewData] = [BlueCellViewData(backgroundColor: .blue), BlueCellViewData(backgroundColor: .blue)]

		self.sectionModels.append(RedSectionViewModel(identifier: String(SectionType.RedSection.rawValue), height: 100, viewDataModel: redViewDataModels))
		self.sectionModels.append(GreenSectionViewModel(identifier: String(SectionType.GreenSection.rawValue), height: 25, viewDataModel: greenViewDataModels))
		self.sectionModels.append(BlueSectionViewModel(identifier: String(SectionType.BlueSection.rawValue), height: 200, viewDataModel: blueViewDataModels))
		print(self.sectionModels.count)
	}
	private let dataManager: DataManager
	private var sectionModels: [TableViewSectionModeling]
}

extension TableViewModel {

	public func getSectionIdentifiers() -> SectionType.AllCases {
		return SectionType.allCases
	}
}







