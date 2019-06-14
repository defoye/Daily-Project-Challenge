//
//  ViewController.swift
//  AutoLayout
//
//  Created by Ernest DeFoy on 6/13/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // let's avoid polluting viewDidLoad
    // curly brace is referred to as closure, or anon. functions
    let buildingImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "oldMain"))
        // this enables auto layout for the imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text!textView textView textView textView textView text!textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text!textView textView textView textView textView text!textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text! textView textView textView textView textView text!textView textView textView textView textView text!textView textView textView textView textView text!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.boldSystemFont(ofSize: 10)
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // here's our entry point to the app
        view.backgroundColor = .yellow
        view.addSubview(buildingImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    private func setupLayout() {
        buildingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buildingImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        buildingImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buildingImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Some prefer to use left and right anchors
        descriptionTextView.topAnchor.constraint(equalTo: buildingImageView.bottomAnchor, constant: 120).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

