//
//  TableViewController.swift
//  PickerView
//
//  Created by Maho Misumi on 2019/02/01.
//  Copyright © 2019年 Maho Misumi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var selectedWeek: String = ""
    var saveData : UserDefaults = UserDefaults.standard
    var todoListArray = [String]()
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: selectedWeek) != nil {
            todoListArray = saveData.object(forKey: selectedWeek) as! [String]
        }
        
        print(todoListArray)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        //todoListArray = saveData.object(forKey: "TodoList") as! [String]
//        if saveData.object(forKey: selectedWeek) != nil {
//            todoListArray = saveData.object(forKey: selectedWeek) as! [String]
//        }
//        table.reloadData()
//    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return todoListArray.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoListArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = todoListArray[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoListArray.remove(at: indexPath.row)//配列から選択したセルの要素を削除
            saveData.set(todoListArray, forKey: selectedWeek)//上のコードで一つ要素を消した配列をUserDefaultsに上書きする
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
         }
         */
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}

