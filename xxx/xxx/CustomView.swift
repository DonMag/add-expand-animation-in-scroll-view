//
//  CustomView.swift
//  xxx
//
//  Created by Yan Cheng Cheok on 07/08/2022.
//

import UIKit

class CustomView: UIView {

    private var zeroHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderView.layer.cornerRadius = stackView.frame.height / 2
        borderView.layer.masksToBounds = true
        borderView.layer.borderWidth = 1
        
        zeroHeightConstraint = self.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 0)
        zeroHeightConstraint.isActive = false
    }
    
    func hide() {
        zeroHeightConstraint.isActive = true
    }
    
    func show() {
        zeroHeightConstraint.isActive = false
    }
}
