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

		// prevent animation issues when adding/removing the first/last custom view
		let v = UIView()
		stackView.addArrangedSubview(v)

		// if stackView spacing is non-zero
		if stackView.spacing != 0 {
			stackView.setCustomSpacing(0, after: v)
		}
		
		addCustomView(false)
	}
	
	func addCustomView(_ animated: Bool) {
		let customView = CustomView.instanceFromNib()
		
		stackView.addArrangedSubview(customView)
		customView.isHidden = true
		
		if animated {
			DispatchQueue.main.async {
				UIView.animate(withDuration: 1) {
					customView.isHidden = false
				}
			}
		} else {
			customView.isHidden = false
		}
	}
	func delCustomView(_ animated: Bool) {
		guard let v = stackView.arrangedSubviews.last as? CustomView else { return }
		if animated {
			UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
				v.isHidden = true
			}, completion: { _ in
				v.removeFromSuperview()
			})
		} else {
			v.removeFromSuperview()
		}
	}
	@IBAction func del(_ sender: Any) {
		delCustomView(true)
	}
	
	@IBAction func add(_ sender: Any) {
		addCustomView(true)
	}
	
}

