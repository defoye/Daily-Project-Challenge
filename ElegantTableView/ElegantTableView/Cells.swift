//
//  Cells.swift
//  ElegantTableView
//
//  Created by Ernest DeFoy on 6/30/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

import UIKit

public protocol Conf {}

//public class ConfigurableCell: UITableViewCell {
//	public func configure(with model: Conf) {
//		// Override
//	}
//}
//
//public struct celViewData: Conf {
//
//}
//
//public class cel: ConfigurableCell {
//	public override func configure(with model: celViewData) {
//		// configure
//	}
//}

//
/////
/////////////////
/////
//

public protocol ModelConfigurable {
	associatedtype Model
	func configure(with model: Model)
}

public protocol SelectableCell {
	func setDelegate(viewControllerDelegate: UITableViewController)
}
///
public protocol CellConfiguring {
	
}
public struct RedCellViewData: CellConfiguring {
	let backgroundColor: UIColor = .red
	init(backgroundColor: UIColor) {
		self.backgroundColor = backgroundColor
	}
}

public class RedCell: UITableViewCell, ModelConfigurable {
	public func configure(with model: RedCellViewData) {
		self.backgroundColor = model.backgroundColor
	}
}
///
struct GreenCellViewData {
	let buttonImage: UIImage
}

class GreenCell: UITableViewCell {
	let button: UIButton = { return UIButton() }()
}

extension GreenCell: ModelConfigurable {
	func configure(with model: GreenCellViewData) {
		configureButton(with: model.buttonImage)
	}

	func configureButton(with image: UIImage) {
		self.button.imageView?.image = image
	}
}
///
class BlueCell: UITableViewCell {
	let textField: UITextField = {
		let field = UITextField()
		return field
	}()
}

struct BlueCellViewData {
	let textFieldPlaceholder: String
}

extension BlueCell: ModelConfigurable {
	func configure(with model: BlueCellViewData) {
		self.configureTextField(with: model.textFieldPlaceholder)
	}

	func configureTextField(with textFieldPlaceholder: String) {
		self.textField.placeholder = textFieldPlaceholder
	}
}
