//
//  ToDoViewController.swift
//  PickerView
//
//  Created by Maho Misumi on 2019/02/01.
//  Copyright © 2019年 Maho Misumi. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    
    var selectedWeek: String = ""
    var saveData : UserDefaults = UserDefaults.standard
    var todoListArray = [String]()
    
    
     @IBOutlet weak var addTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = selectedWeek
        // Do any additional setup after loading the view.
    }
    

    @IBAction func save(_ sender: Any) {
        
        todoListArray.append(addTextField.text!)
        
        addTextField.text=""
        
        saveData.set(todoListArray, forKey: selectedWeek)
        
        self.dismiss(animated: true, completion: nil)
        print(todoListArray)
        
        performSegueToTableViewController()
        
    }
    //    //segueを呼び出すときに必要なメソッド
    func performSegueToTableViewController() {
        performSegue(withIdentifier: "toTableViewController", sender: nil)
    }
    
    //segueを準備するとき呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTableViewController" {
            let toTableViewController = segue.destination as! TableViewController
            toTableViewController.selectedWeek = self.selectedWeek as! String
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
