//
//  ViewController.swift
//  savesum
//
//  Created by Tapaswini Kodavanti on 8/17/22.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var monthYearLabel: UILabel!
    
    @IBOutlet weak var goalLabel: UILabel!
    
    var s = "Checking to see if the push worked"

    @IBOutlet weak var monthGoalTextField: UITextField!
    
    @IBOutlet weak var goalTextField: UITextField!
    
    @IBAction func goalPressed(_ sender: Any) {
        if let monthYear = monthGoalTextField.text {
            monthYearLabel.text = monthYear
        }
        
        if let goal = goalTextField.text {
            goalLabel.text = "$\(goal) left"
        }
        
    }
    
}

