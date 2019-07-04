////
////  ViewController.swift
////  StockFetch
////
////  Created by Ernest DeFoy on 6/15/19.
////  Copyright © 2019 Ernest DeFoy. All rights reserved.
////
//
//import UIKit
//
//class StocksViewController: UIViewController {
//    private var symbol: String = ""
//    private var stocks: [StockDateModel] = []
//    private let stocksTableView = StocksTableView()
//    
//    var customView = E3StockPlot()
//
//}
//
//extension StocksViewController {
//    
//    // MARK: Lifecycle
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//		
////		// TODO
////		self.customView.layoutIfNeeded()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        let url = constructURLForSymbol(symbol: "AAPL")
////        let request = NetworkRequest(url: url)
////        request.execute { [weak self] (data) in
////            data.map { self?.decode($0) }
////        }
//		// TODO: Offline data
//		let bundle = Bundle(for: type(of: self))
//		guard let url = bundle.url(forResource: "StockHistory", withExtension: "json"),
//			let data = try? Data(contentsOf: url) else {
//				print("Couldn't find data")
//				return
//		}
//
//		self.decode(data)
//        view.backgroundColor = .red
//        stocksTableView.delegate = self
//        stocksTableView.dataSource = self
//        view.addSubview(stocksTableView)
//        setupTableView()
//		
//		// TODO
//		view.addSubview(customView)
////		setupCustomView()
//    }
//}
//
//extension StocksViewController {
//    // MARK: test
//    // TODO: Remove
//    
////    func setupCustomView() {
////        customView.backgroundColor = .blue
////        customView.translatesAutoresizingMaskIntoConstraints = false
////        
////        let safe = view.safeAreaLayoutGuide
////        NSLayoutConstraint.activate([customView.topAnchor.constraint(equalTo: safe.topAnchor),
////                                     customView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
////                                     customView.leftAnchor.constraint(equalTo: safe.leftAnchor),
////                                     customView.rightAnchor.constraint(equalTo: safe.rightAnchor)])
////    }
//}
//
//extension StocksViewController {
//    
//    func setupTableView() {
//        stocksTableView.register(StockCell.self, forCellReuseIdentifier: "stockCell")
//        
//        stocksTableView.backgroundColor = .blue
//        stocksTableView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let safe = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([stocksTableView.topAnchor.constraint(equalTo: safe.topAnchor),
//                                     stocksTableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
//                                     stocksTableView.leftAnchor.constraint(equalTo: safe.leftAnchor),
//                                     stocksTableView.rightAnchor.constraint(equalTo: safe.rightAnchor)])
//    }
//}
//
//extension StocksViewController: UITableViewDelegate {
//
//}
//
//extension StocksViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return stocks.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath) as! StockCell
//        let stockData = stocks[indexPath.row]
//
//        cell.configure(name: String(stockData.dateString))
//        return cell
//    }
//}
//
//extension StocksViewController {
//    
//    public func constructURLForSymbol(symbol: String) -> URL {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.worldtradingdata.com"
//        components.path = "/api/v1/history"
//        components.queryItems = [
//            URLQueryItem(name: "symbol", value: symbol),
//            URLQueryItem(name: "api_token", value: "8ZC3vUHXTaAr04d0elr1yNzo2WU2VlMgJuXxvRwX4gLhPospKkoZgsmpAZu2")]
//        
//        return components.url!
//    }
//}
//
//
//private extension StocksViewController {
//	
//	// TODO
//	func configureCustomView(points: [CGPoint]) {
//
//	}
//    
//    func decode(_ data: Data) {
//        let decoder = JSONDecoder()
//        let stockHistory = (try? decoder.decode(StockHistory.self, from: data)) ?? nil
////        self.symbol = stockHistory?.symbol ?? "None"
////        self.stocks = stockHistory?.stocks ?? []
////        self.stocks.sort(by: ( {$0.dateString < $1.dateString}))
////
//
////        var points: [CGPoint] = []
////        var i: CGFloat = 0.0
////		
////		var n: Int = self.stocks.count
////		let half = n/2
////		
////        for k in 0...half {
////			let stock = self.stocks[k]
////            // TODO
////            let x: CGFloat = i
////            let y: CGFloat = CGFloat(stock.high)
////            i = i + 1
////            let point = CGPoint(x: x, y: y)
////            points.append(point)
////        }
////		
////        DispatchQueue.main.async {
//////            self.stocksTableView.reloadData()
//////			print(points)
////			self.configureCustomView(points: points)
//////			self.customView.points = points
////			self.customView.setNeedsDisplay()
////			print("customView configured")
////        }
//    }
//}
//
