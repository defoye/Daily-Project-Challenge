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
	
	let appContext: AppContext? = {
		guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
		return AppContext(context: appDelegate.persistentContainer.viewContext)
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .orange
		createData()
//		deleteAllUsers()
		appContext?.updateData(entity: DataEntity.USER,
				   predicate: NSPredicate(format: "username = %@", "defoye1"),
				   newValue: "DeFoye1",
				   key: "username")
		retrieveData(entity: DataEntity.USER)
	}
	
	func deleteAllUsers() {
		appContext?.deleteData(entity: DataEntity.USER,
							   predicate: NSPredicate(format: "username = %@", "DeFoye1"))
		appContext?.deleteData(entity: DataEntity.USER,
							   predicate: NSPredicate(format: "username = %@", "defoye1"))
		appContext?.deleteData(entity: DataEntity.USER,
							   predicate: NSPredicate(format: "username = %@", "defoye2"))
		appContext?.deleteData(entity: DataEntity.USER,
							   predicate: NSPredicate(format: "username = %@", "defoye3"))
		appContext?.deleteData(entity: DataEntity.USER,
							   predicate: NSPredicate(format: "username = %@", "defoye4"))
		appContext?.deleteData(entity: DataEntity.USER,
							   predicate: NSPredicate(format: "username = %@", "defoye5"))
	}

	func createData() {
		guard let viewContext = appContext?.managedContext else { return }

		guard let userEntity = NSEntityDescription.entity(forEntityName: DataEntity.USER, in: viewContext) else { return }
		
		for i in 1...5 {
			let user = NSManagedObject(entity: userEntity, insertInto: viewContext)
			user.setValue("defoye\(i)", forKey: DataKey.USERNAME)
			user.setValue("defoye\(i)@gmail.com", forKey: DataKey.EMAIL)
			user.setValue("defoye\(i*5)", forKey: DataKey.PASSWORD)
		}
		
		appContext?.saveContext()
	}
	
	func retrieveData(entity: String) {
		let objects: [NSManagedObject]? = appContext?.fetchData(entity: entity, predicate: nil)

		for data in objects as! [NSManagedObject] {
			print(data.value(forKey: DataKey.USERNAME) as! String)
		}
	}
}

