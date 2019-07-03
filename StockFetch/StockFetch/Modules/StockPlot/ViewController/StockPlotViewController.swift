//
//  StockPlotViewController.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

enum StockPlotTableViewSection: CaseIterable {
	case stockPlot
	case otherInfo
}

public class StockPlotViewController: UIViewController {
	private var symbol: String = ""
	private var alphaAdvantageTimeSeries : [AlphaAdvantageTimeStamp] = []
	
//	var customView = E3StockPlot()
	var tableView = UITableView()
	var stockPlotViewModel: StockPlotViewModel
	
	public init(viewModel: StockPlotViewModel) {
		self.stockPlotViewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension StockPlotViewController {
	
	// MARK: Lifecycle
	
	override public func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.register(StockCell.self, forCellReuseIdentifier: "stockCell")
		tableView.register(StockPlotCell.self, forCellReuseIdentifier: CellType.lineplot.rawValue)

		self.tableView.delegate = self
		self.tableView.dataSource = stockPlotViewModel
		
		// Load data.
		stockPlotViewModel.loadTimeSeriesIntraDay {
			// Success.
			// Reload views..
//			tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
			DispatchQueue.main.async {
				print("Reload tableView")
				self.tableView.reloadData()
			}
		}
	}
	
	override public func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
}

extension StockPlotViewController {
	
	// MARK:- Setup & Constraints
	
	func setup() {
		addSubviews()
		setupTableView()
		setupColorScheme()
	}
	
	func addSubviews() {
		view.addSubview(tableView)
	}
	func setupTableView() {
		self.view.constrainSubViewToSafeArea(subView: tableView)
	}
	
	func setupColorScheme() {
		view.backgroundColor = .red
		tableView.backgroundColor = .green
	}
}

extension StockPlotViewController: UITableViewDelegate {
	public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}
}




