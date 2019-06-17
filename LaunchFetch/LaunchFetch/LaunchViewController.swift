//
//  ViewController.swift
//  LaunchFetch
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class LaunchViewController: UITableViewController {
    private var isRefreshing = true
}

extension LaunchViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        tableView.refreshControl = refreshControl
//        The line tableView.contentOffset = CGPoint(x:0, y:-refreshControl.frame.size.height) in the viewDidLoad() should not  be necessary. But from some strange reason, without it the activity indicator does not change its color to white. The mysterious bugs of the iOS SDK…
        tableView.contentOffset = CGPoint(x:0, y:-refreshControl.frame.size.height)
        tableView.refreshControl?.beginRefreshing()
        // It is common to start network requests when a view controller is loaded or appears on the screen.
        fetchLaunch()
    }
}

private extension LaunchViewController {
    func fetchLaunch() {
        let url = URL(string: "https://api.spacexdata.com/v3/launches/65")!
        let request = NetworkRequest(url: url)
        request.execute { [weak self] (data) in
            self?.isRefreshing = false
            self?.tableView.reloadData()
            self?.tableView.refreshControl?.endRefreshing()
            if let data = data {
                self?.decode(data)
            }
        }
    }
    
    func decode(_ data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
        if let launch = try? decoder.decode(Launch.self, from: data) {
            set(launch)
        }
    }
    
    func set(_ launch: Launch) {
        // configure the view
        
        // then fetch the image
        fetchPatch(withURL: launch.patchURL)
    }
    
    func fetchPatch(withURL url: URL) {
        let request = NetworkRequest(url: url)
        request.execute { [weak self] (data) in
            guard let data = data else {
                return
            }
//            self?.patchImageView.image = UIImage(data: data)
//            self?.patchActivityIndicator.stopAnimating()
        }
    }
}

