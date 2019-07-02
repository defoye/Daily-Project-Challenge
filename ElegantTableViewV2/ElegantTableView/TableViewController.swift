//
//  TableViewController.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 6/30/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit



public protocol TableViewControlling {
	
	init(tableViewModel: TableViewModeling)
}

public enum TypeIdentifier: String, CaseIterable {
	case RedCellIdentifier
	case GreenCellIdentifier
	case BlueCellIdentifier
}

public enum SectionType: Int, CaseIterable {
	case RedSection
	case GreenSection
	case BlueSection
}

public class TableViewController: UIViewController, TableViewControlling {
	// MARK:- Instance data.
	private var tableViewModel: TableViewModeling
	private var tableView: UITableView
	private var typeMap: [SectionType : TypeIdentifier] = [:]
	
	// MARK:- Initializers.
	public required init(tableViewModel: TableViewModeling) {
		self.tableViewModel = tableViewModel
		self.tableView = UITableView()
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension TableViewController {
	// MARK:- Lifecycle
	override public func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.register(RedCell.self, forCellReuseIdentifier: TypeIdentifier.RedCellIdentifier.rawValue)
		tableView.register(GreenCell.self, forCellReuseIdentifier: TypeIdentifier.GreenCellIdentifier.rawValue)
		tableView.register(BlueCell.self, forCellReuseIdentifier: TypeIdentifier.BlueCellIdentifier.rawValue)
		
		for (identifier,Type) in Array(zip(TypeIdentifier.allCases,SectionType.allCases)) {
			typeMap[Type] = identifier
		}
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension TableViewController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewModel.numberOfRowsInSection(section: section)
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		let identifier = tableViewModel.cellTypeForRowAt(indexPath: indexPath)
//		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ModelConfigurable
//		cell.configure(with: tableViewModel.getStateForRowAt(indexPath: indexPath))
//		cell.configure(with: <#T##ConfigurationType#>)
//		tableViewModel.configurationBlock
		
		guard let section = SectionType(rawValue: indexPath.section) else { fatalError() }
		guard let identifier = typeMap[section] else { fatalError() }
		
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier.rawValue, for: indexPath)
		
		switch section {
		case .RedSection:
			(cell as! RedCell).configure(with: tableViewModel.getStateForRowAt(indexPath: indexPath))
		case .GreenSection:
			(cell as! GreenCell).configure(with: tableViewModel.getStateForRowAt(indexPath: indexPath))
		case .BlueSection:
			(cell as! BlueCell).configure(with: tableViewModel.getStateForRowAt(indexPath: indexPath))
		}
		
		return cell 
	}


}

extension TableViewController: UITableViewDelegate {
	
}
//let identifier = tableViewModel.cellTypeForRowAt(indexPath: indexPath)
//let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ModelConfigurable
////		cell.configure(with: tableViewModel.getStateForRowAt(indexPath: indexPath))
////		cell.configure(with: <#T##ConfigurationType#>)
////		tableViewModel.configurationBlock
//guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else { fatalError("Unexpected Index Path") }
//
//return cell as! UITableViewCell
