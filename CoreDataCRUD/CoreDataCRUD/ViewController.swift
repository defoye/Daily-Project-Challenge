//
//  ViewController.swift
//  CoreDataCRUD
//
//  Created by Ernest DeFoy on 9/22/19.
//  Copyright © 2019 Ernest DeFoy III. All rights reserved.
//

import UIKit
import CoreData

public struct DataKey {
	static let USERNAME = "username"
	static let EMAIL = "email"
	static let PASSWORD = "password"
}

public struct DataEntity {
	static let USER = "User"
}

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .orange
		createData()
		deleteData(entity: DataEntity.USER,
				   predicate: NSPredicate(format: "username = %@", "DeFoye1"))
		updateData(entity: DataEntity.USER,
				   predicate: NSPredicate(format: "username = %@", "defoye1"),
				   newValue: "DeFoye1",
				   key: "username")
		retrieveData(entity: DataEntity.USER)
	}

	func createData() {
		guard let viewContext = AppContext.managedContext else { return }

		guard let userEntity = NSEntityDescription.entity(forEntityName: DataEntity.USER, in: viewContext) else { return }
		
		for i in 1...5 {
			let user = NSManagedObject(entity: userEntity, insertInto: viewContext)
			user.setValue("defoye\(i)", forKey: DataKey.USERNAME)
			user.setValue("defoye\(i)@gmail.com", forKey: DataKey.EMAIL)
			user.setValue("defoye\(i*5)", forKey: DataKey.PASSWORD)
		}
		
		do {
			try viewContext.save()
		} catch let err as NSError {
			print("Could not save")
		}
	}
	
	func retrieveData(entity: String) {
		let objects: [NSManagedObject]? = AppContext.fetchData(entity: entity, predicate: nil)

		for data in objects as! [NSManagedObject] {
			print(data.value(forKey: DataKey.USERNAME) as! String)
		}
	}
	
	func updateData(entity: String, predicate: NSPredicate, newValue: Any, key: String) {
		guard let objects: [NSManagedObject] = AppContext.fetchData(entity: entity, predicate: predicate) else { return }

		for obj in objects {
			obj.setValue(newValue, forKey: key)
		}
		
		do {
			try AppContext.managedContext?.save()
		} catch let err {
			print(err)
		}
	}
	
	func deleteData(entity: String, predicate: NSPredicate) {
		guard let viewContext = AppContext.managedContext else { return }
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
		
		fetchRequest.predicate = predicate
		
		do {
			let result = try viewContext.fetch(fetchRequest)
			
			guard let objects = result as? [NSManagedObject] else { return }
			
			for object in objects {
				viewContext.delete(object)
			}
		} catch let err {
			print(err)
		}
	}
}

