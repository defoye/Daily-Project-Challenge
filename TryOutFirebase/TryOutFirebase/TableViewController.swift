//
//  TableViewController.swift
//  TryOutFirebase
//
//  Created by Ernest DeFoy on 6/24/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit
import Firebase

enum TableViewControllerSection: CaseIterable {
	case setDocument
	case addDocument
	case getDocument
}

class TableViewCell: UITableViewCell {
	let label: UITextView = {
		let label = UITextView()
		label.isScrollEnabled = false
		label.isEditable = false
		label.translatesAutoresizingMaskIntoConstraints = false
		// TODO: Important!  Made cell not selectable.
		// Passes touches to the parent view.
		label.isUserInteractionEnabled = false
		return label
	}()
	
	func configureLabel(font: UIFont, text: String) {
		self.addSubview(label)
		label.text = text
		label.sizeToFit()
		label.font = font
		NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: self.topAnchor),
			label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			label.leftAnchor.constraint(equalTo: self.leftAnchor),
			label.rightAnchor.constraint(equalTo: self.rightAnchor)])
	}
}

class TableViewController: UITableViewController {

	let reuseIdentier: String = "defaultCell"
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentier)
		tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
		self.tableView.isEditing = false
		self.tableView.allowsSelection = true
		self.tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return TableViewControllerSection.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		
		let sectionCase = TableViewControllerSection.allCases[section]
		
		return 1
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentier, for: indexPath) as! UITableViewCell
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
		
		let sectionCase = TableViewControllerSection.allCases[indexPath.section]
		
		let cellFont = UIFont.systemFont(ofSize: 14)
		
		switch (sectionCase) {
		case .setDocument:
			cell.configureLabel(font: cellFont, text: "Set Document")
		case .addDocument:
			cell.configureLabel(font: cellFont, text: "Add Document")
		case .getDocument:
			cell.configureLabel(font: cellFont, text: "Get Document")
		default:
			cell.configureLabel(font: UIFont.systemFont(ofSize: 14), text: "No label")
		}

        return cell
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
}

extension TableViewController {
	
	// MARK:- TableViewControllerDelegate
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		switch TableViewControllerSection.allCases[indexPath.section] {
		case .setDocument:
			setDocumentButtonAction(row: indexPath.row)
		case .addDocument:
			addDocumentButtonAction(row: indexPath.row)
		case .getDocument:
			getDocumentButtonAction(row: indexPath.row)
		default:
			return
		}
	}
}

let db = Firestore.firestore()
struct TestStruct: Encodable {
	public enum Field: String {
		case name = "name"
		case doubleNum = "doubleNum"
		case array = "array"
	}
	let name: String
	let doubleNum: Double
	let array: [Int]
	
	init(name: String, rowNum:Double,array:[Int]) {
		self.name = name
		self.doubleNum = rowNum
		self.array = array
	}
}

enum FirebaseCollection: String {
	case cities = "cities"
}

enum FirebaseDocID: String {
	case la = "LA"
}

extension TableViewController {
	func setDocumentButtonAction(row: Int) {
		let struct1 = TestStruct(name: "name2", rowNum: Double(row), array: [5,6,7,8])
		let docRef: DocumentReference = db.collection(FirebaseCollection.cities.rawValue).document(FirebaseDocID.la.rawValue)
		db.setData(docRef: docRef, model: struct1)
	}
	
	func addDocumentButtonAction(row: Int) {
		let struct1 = TestStruct(name: "name2", rowNum: Double(row), array: [5,6,7,8])
		let collectionRef = db.collection("Collection \(row)")
		db.addDocument(collectionRef: collectionRef, model: struct1)
	}
	
	func getDocumentButtonAction(row: Int) {
		let struct1 = TestStruct(name: "name2", rowNum: Double(row), array: [5,6,7,8])
		let docRef: DocumentReference = db.collection("getThisCollection").document("getThisDocumentID")
		db.getDocument(docRef: docRef, completion: { (model: TestGetDocument?) in
			guard let model = model else { return }
		})
	}
}

struct TestGetDocument: Decodable {
	let getThisKey: String
	
//	enum CodingKeys: String, CodingKeys {
//		case getThisKey = "getThisKey"
//		case getThisValue = "
//	}
}
