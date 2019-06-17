//
//  LaunchesViewController.swift
//  LaunchFetch
//
//  Created by Ernest DeFoy on 6/16/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class LaunchesViewController: UITableViewController {
    var launches: [Launch] = []
    
    let reuseIdentifier = "Cellid"
    let launchCellIdentifier = "launchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.register(LaunchCell.self, forCellReuseIdentifier: launchCellIdentifier)

        let url = URL(string: "https://api.spacexdata.com/v3/launches?limit=10")!
        let request = NetworkRequest(url: url)
        request.execute { [weak self] (data) in
            data.map { self?.decode($0) }
        }
    }
}

private extension LaunchesViewController {
    func decode(_ data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
        do {
            launches = try decoder.decode([Launch].self, from: data)
            tableView.reloadData()
        } catch {
            let title = "Oops, something went wrong"
            let message = "Please make sure you have the latest version of the app."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: title, style: .default, handler: nil)
            alertController.addAction(dismissAction)
            show(alertController, sender: nil)
        }
    }
}

extension LaunchesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let launch = launches[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: launchCellIdentifier) as! LaunchCell
        cell.configure(name: launch.missionName)
        
        return cell
    }
    
    //The correct solution to fetch the images for the cells in a table view is quite straightforward. So much that I am surprised not to see it used more often.c
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var launch = launches[indexPath.row]
        if let _ = launch.patch {
            return
        }
        let request = NetworkRequest(url: launch.patchURL)
        request.execute { [weak self](data) in
            guard let data = data else {
                return
            }
            launch.patch = UIImage(data: data)
            self?.launches[indexPath.row] = launch
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}

class LaunchCell: UITableViewCell {
    
    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .clear
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Text"
        view.isEditable = false
        view.isScrollEnabled = false
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    func configure(name: String) {
        addSubview(textView)
        
        textView.text = name
        
        NSLayoutConstraint.activate([textView.topAnchor.constraint(equalTo: contentView.topAnchor),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textView.rightAnchor.constraint(equalTo: contentView.rightAnchor)])
    }
}
