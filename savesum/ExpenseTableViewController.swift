//
//  ExpenseTableViewController.swift
//  savesum
//
//  Created by Tapaswini Kodavanti on 8/17/22.
//

import UIKit

class ExpenseTableViewController: UITableViewController {
    
    var expenses : [Expense] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        expenses = createExpenses()
        
        func 
    }
    
    func createExpenses() -> [Expense] {

        let dinner = Expense()
        dinner.title = "Dinner at Olive Garden"
        dinner.cost = 21.43

        let gas = Expense()
        gas.title = "Gas for Car"
        gas.cost = 61.58

        return [dinner, gas]
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return expenses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let expense = expenses[indexPath.row]
        cell.textLabel?.text = "$\(expense.cost) --- \(expense.title)"

        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addVC = segue.destination as? ViewController {
            addVC.previousVC = self
          
        }
    }
    

}
