//
//  Cells.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 6/30/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol ConfigurationType {}
public protocol ModelConfigurable {
	func configure(with model: ConfigurationType)
}

//struct RedCellViewData {
//	let backgroundColor: UIColor = .red
//}
//
//class RedCell: UITableViewCell, ModelConfigurable {
//	func configure(with model: ConfigurationType) {
//		<#code#>
//	}
//	
//}

//
/////
/////////////////
/////
//

public protocol DataDisplaying {
	associatedtype Model
	func configure(with model: Model)
}

public protocol SelectableCell {
	func setDelegate(viewControllerDelegate: UITableViewController)
}

struct RedCellViewData {
	let backgroundColor: UIColor = .red
}

class RedCell: UITableViewCell, DataDisplaying {
	func configure(with model: RedCellViewData) {
		self.backgroundColor = model.backgroundColor
	}
}

struct GreenCellViewData {
	let buttonImage: UIImage
}

class GreenCell: UITableViewCell {
	let button: UIButton = { return UIButton() }()
}

extension GreenCell: DataDisplaying {
	func configure(with model: GreenCellViewData) {
		configureButton(with: model.buttonImage)
	}

	func configureButton(with image: UIImage) {
		self.button.imageView?.image = image
	}
}

class BlueCell: UITableViewCell {
	let textField: UITextField = {
		let field = UITextField()
		return field
	}()
}

struct BlueCellViewData {
	let textFieldPlaceholder: String
}

extension BlueCell: DataDisplaying {
	func configure(with model: BlueCellViewData) {
		self.configureTextField(with: model.textFieldPlaceholder)
	}

	func configureTextField(with textFieldPlaceholder: String) {
		self.textField.placeholder = textFieldPlaceholder
	}
}
