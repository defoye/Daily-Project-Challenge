//
//  StockPlotViewModel.swift
//  StockFetch
//
//  Created by Ernest DeFoy on 6/22/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

typealias TimeSeriesFetched = () -> Void

public enum CellType: String, CaseIterable {
	case lineplot
}

public protocol StockPlotViewModelProtocol {
	func registerCells()
	associatedtype Model
	func constructViewDataModels(withModel: Model)
}

public class StockPlotViewModel: NSObject {
	
	private var viewDataModels: [[TableViewCellViewDataProtocol]]?
	///
	private var dataManager: AlphaAdvantageDataManager
	private var alphaAdvantageTimeSeries: [AlphaAdvantageTimeStamp] = []
	
	init(dataManager: AlphaAdvantageDataManager) {
		self.dataManager = dataManager
	}
}

extension StockPlotViewModel: StockPlotViewModelProtocol {
	public func constructViewDataModels(withModel: AlphaAdvantageTimeSeries) {
		// TODO, maybe deprecate
	}
	
	public func registerCells() {
		// TODO
	}
	
	// TODO:- fucked up
	private func constructViewDataForLinePlot(model: AlphaAdvantageTimeSeries) {
		let formatter: DateFormatter = DateFormatter.fullISO8601
		
		var timestampPoints: [(Date?,CGPoint)] = []
		var points: [CGPoint] = []
		var i: CGFloat = 0.0
		// Array by open prices
		for timestamp in model.alphaAdvantageTimeSeries {
			let x: CGFloat = i
			let y = CGFloat(timestamp.open)
			i = i + 1
			let point: CGPoint = CGPoint(x: x, y: y)
			points.append(point)
			let date = formatter.date(from: timestamp.timeStampString)
			timestampPoints.append((date,point))
		}
		print("points: \(points)")
		let viewData = [E3StockPlotViewData(type: CellType.lineplot.rawValue, points: points)]
		viewDataModels = []
		viewDataModels?.append(viewData)
		print("viewModels: \(viewDataModels!.count)")
	}
}

extension StockPlotViewModel {
	// MARK:- Networking
	
	func loadTimeSeriesIntraDay(completionBlock: @escaping TimeSeriesFetched) {
		dataManager.getTimeSeriesIntraDay(function: "TIME_SERIES_INTRADAY", symbol: "MSFT", interval: "5min") {
			metaData,timeSeries,error in
			if let error = error {
				print("Fetch time series error: \(error)")
				return
			}
			guard metaData != nil else { return }
			guard let timeSeries = timeSeries else { return }
			// Success
//			self.constructViewDataModels(withModel: timeSeries)
			self.constructViewDataForLinePlot(model: timeSeries)
			completionBlock()
		}
	}
}

extension StockPlotViewModel: UITableViewDataSource {
	public func numberOfSections(in tableView: UITableView) -> Int {
		return viewDataModels?.count ?? 0
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewDataModels?[section].count ?? 0
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let models = viewDataModels else { return UITableViewCell() }
		
		let identifier = models[indexPath.section][0].type
		let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCellProtocol
		
		cell.configure(withViewData: models[indexPath.section][0])
		
		return cell as! UITableViewCell
	}
}
