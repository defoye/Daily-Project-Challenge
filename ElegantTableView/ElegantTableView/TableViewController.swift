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

public class TableViewController: UIViewController, TableViewControlling {
	private var tableViewModel: TableViewModeling
	private var tableView: UITableView
	
	public required init(tableViewModel: TableViewModeling) {
		self.tableViewModel = tableViewModel
		self.tableView = UITableView()
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override public func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		for (identifier,Type) in tableViewModel.cellTypeMap {
			tableView.register(Type, forCellReuseIdentifier: identifier.description)
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
		let identifier = tableViewModel.cellTypeForRowAt(indexPath: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ModelConfigurable
//		cell.configure(with: tableViewModel.getStateForRowAt(indexPath: indexPath))
//		cell.configure(with: <#T##ConfigurationType#>)
//		tableViewModel.configurationBlock
		
		return cell as! UITableViewCell
	}


}

extension TableViewController: UITableViewDelegate {
	
}
