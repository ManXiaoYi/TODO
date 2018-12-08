//
//  TodoListViewController.swift
//  TODO
//
//  Created by 满孝意 on 2018/12/8.
//  Copyright © 2018 ManXiaoYi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["购买水杯", "吃药", "修改密码"]


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()

        let alertVC = UIAlertController(title: "添加一个新的TODO项目", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "添加项目", style: .default) { (action) in
            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alertVC.addTextField { (alertTextField) in
            alertTextField.placeholder = "创建一个新项目......"
            textField = alertTextField
        }
        alertVC.addAction(alertAction)
        present(alertVC, animated: true, completion: nil)

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)

        cell.textLabel?.text = itemArray[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        print(indexPath.row)
    }

}
