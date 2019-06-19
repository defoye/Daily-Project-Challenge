//
//  StockHistory+CoreDataProperties.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/17/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//
//

import Foundation
import CoreData


extension StockHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StockHistory> {
        return NSFetchRequest<StockHistory>(entityName: "StockHistory")
    }

    @NSManaged public var name: String?

}
