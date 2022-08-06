//
//  ViewController.swift
//  xxx
//
//  Created by Yan Cheng Cheok on 07/08/2022.
//

import UIKit

extension UIView {
    static func instanceFromNib() -> Self {
        return getUINib().instantiate(withOwner: self, options: nil)[0] as! Self
    }
    
    static func getUINib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        add(0)
    }

    @IBAction func add(_ sender: Any) {
        let customView = CustomView.instanceFromNib()
        
        customView.hide()
        stackView.addArrangedSubview(customView)
        // Clear off horizontal swipe in animation caused by addArrangedSubview
        stackView.superview?.layoutIfNeeded()
        
        customView.show()
        // Perform expand animation.
        UIView.animate(withDuration: 1) {
            self.stackView.superview?.layoutIfNeeded()
        }
    }
    
}

