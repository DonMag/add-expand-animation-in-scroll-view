//
//  CustomView.swift
//  xxx
//
//  Created by Yan Cheng Cheok on 07/08/2022.
//

import UIKit

class CustomView: UIView {
	
	@IBOutlet weak var borderView: UIView!
	@IBOutlet weak var stackView: UIStackView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		borderView.layer.masksToBounds = true
		borderView.layer.borderWidth = 1
		
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		borderView.layer.cornerRadius = borderView.bounds.height * 0.5
	}
}
