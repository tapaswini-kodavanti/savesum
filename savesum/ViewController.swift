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
    var previousVC = ExpenseTableViewController()
    
    @IBOutlet weak var expenseTitle: UITextField!
    
    @IBOutlet weak var expenseCost: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Adding a new expense
    
    @IBAction func addExpense(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let expense = ExpenseCD(entity: ExpenseCD.entity(), insertInto: context)
            
            if let expenseName = expenseTitle.text {
                expense.title = expenseName
                expense.cost = (expenseCost.text! as NSString).doubleValue
            }
            
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
        
        
//        previousVC.expenses.append(expense)
//
//        previousVC.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
//        print(previousVC.expenses)
        
        // we have to grab this view context to be able to work with Core Data
//       if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
//
//            // we are creating a new ToDoCD object here, naming it toDo
//            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
//
//            // if the titleTextField has text, we will call that text titleText
//            if let titleText = titleTextField.text {
//                // we will take the titleText and assign that value to toDo.name
//                // this .name and .important came from the attributes you typed in on the Core Data page!
//                toDo.name = titleText
//                toDo.important = importantSwitch.isOn
//            }
//
//            try? context.save()
//
//            navigationController?.popViewController(animated: true)
//          }
    }
    
    
    // Month Goal Changer
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

