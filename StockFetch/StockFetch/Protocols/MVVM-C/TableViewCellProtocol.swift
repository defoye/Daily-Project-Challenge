//
//  TableViewCellProtocol.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/27/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import Foundation

enum CustomCellType: String, CaseIterable {
	case profile
	case description
	case comment
	case image
}

// Ideais that we will have a matrix of viewdatamodels.. each has a type (assigned by an enum which also doubles as a nice overview at the top of the file).. that will be used as the cell identifier

// TableViewCells MUST conform to this protocol

public protocol TableViewCellViewDataProtocol {
	var type: String { get }
}

public protocol TableViewCellProtocol {
	func configure<ViewDataModel>(withViewData: ViewDataModel)
}


