//
//  AppContext.swift
//  CoreDataCRUD
//
//  Created by Ernest DeFoy on 9/22/19.
//  Copyright © 2019 Ernest DeFoy III. All rights reserved.
//

import UIKit
import CoreData

public class AppContext {
	static let managedContext: NSManagedObjectContext? = {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
		return appDelegate.persistentContainer.viewContext
	}()
	
	static func fetchData(entity: String, predicate: NSPredicate?) -> [NSManagedObject]? {
		guard let viewContext = AppContext.managedContext else { return nil }
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
		
		if predicate != nil {
			fetchRequest.predicate = predicate
		}
		
		do {
			let result = try viewContext.fetch(fetchRequest)
			
			guard let objects = result as? [NSManagedObject] else { return nil }
			
			return objects
		} catch let err {
			print(err)
		}
		
		return nil
	}
	
	static func fetchEntityDescription(name: String) -> NSEntityDescription? {
		var entity: NSEntityDescription? = nil
		
		if let context = self.managedContext {
			if let userEntity = NSEntityDescription.entity(forEntityName: name, in: context) {
				entity = userEntity
			}
		}
		
		return entity
	}
	
	static func saveContext() {
		do {
			try self.managedContext?.save()
		} catch let err {
			// TODO: Log error. 
			print(err)
		}
	}
	
	static func deleteData(entity: String, predicate: NSPredicate) {
		guard let viewContext = AppContext.managedContext else { return }
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
		
		fetchRequest.predicate = predicate
		
		do {
			let result = try viewContext.fetch(fetchRequest)
			
			guard let objects = result as? [NSManagedObject] else { return }
			
			for object in objects {
				viewContext.delete(object)
			}
			
			self.saveContext()
		} catch let err {
			print(err)
		}
	}
}
