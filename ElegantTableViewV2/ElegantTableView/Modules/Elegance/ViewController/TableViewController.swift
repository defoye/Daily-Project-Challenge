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

public enum SectionType: Int, CaseIterable {
	case RedSection
	case GreenSection
	case BlueSection
}

public class TableViewController: UIViewController, TableViewControlling {
	// MARK:- Instance data.
	private var tableViewModel: TableViewModeling
	private var tableView: UITableView
	
	// MARK:- Initializers.
	public required init(tableViewModel: TableViewModeling) {
		self.tableViewModel = tableViewModel as! TableViewModel
		self.tableView = UITableView()
		super.init(nibName: nil, bundle: nil)
		
		self.view = self.tableView
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		for identifier in (tableViewModel as! TableViewModel).getSectionIdentifiers() {
			switch identifier {
			case .RedSection:
				tableView.register(RedCell.self, forCellReuseIdentifier: String(SectionType.RedSection.rawValue))
			case .GreenSection:
				tableView.register(GreenCell.self, forCellReuseIdentifier: String(SectionType.GreenSection.rawValue))
			case .BlueSection:
				tableView.register(BlueCell.self, forCellReuseIdentifier: String(SectionType.BlueSection.rawValue))
			}
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension TableViewController {
	// MARK:- Lifecycle
	override public func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	
		// THIS caused the cells not to register on time
//		tableView.register(GreenCell.self, forCellReuseIdentifier: TypeIdentifier.GreenCellIdentifier.rawValue)
//		tableView.register(BlueCell.self, forCellReuseIdentifier: TypeIdentifier.BlueCellIdentifier.rawValue)
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension TableViewController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return tableViewModel.heightForRowAt(indexPath: indexPath)
	}
	
	public func numberOfSections(in tableView: UITableView) -> Int {
		return tableViewModel.numberOfSections()
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableViewModel.numberOfRowsForSection(section: section)
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let identifier = tableViewModel.cellIdentifierForSectionAt(section: indexPath.section)
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCellProtocol

		cell.configure(model: tableViewModel.cellViewModelForRowAt(indexPath: indexPath))
		
		return cell as! UITableViewCell
	}


}

extension TableViewController: UITableViewDelegate {
	
}
