//
//  ViewController.swift
//  PickerView
//
//  Created by Maho Misumi on 2019/01/18.
//  Copyright © 2019年 Maho Misumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let weekList = ["(月)","（火）","(水)","(木)","(金)","(土)","(日)"]
    var selectedWeek: String = ""
    
    //    let storyboard = UIStoryboard(name: "STORYBOARD_NAME", bundle: nil)
    //    let nextVC = storyboard.instantiateViewControllerWithIdentifier("STORYBOARD_ID_OF_VC_CLASS") as! UIViewController
    //    navigationController?.pushViewController(nextVC, animated: true)
    
//    let storyboard = UIStoryboard(name: "MainStoryBoard", bundle: nil)
//    let nevtVC = UIStoryboard.instantiateViewController(withIdentifier: ToDoViewController)
////

    
    
    @IBOutlet var weekPicker: UIPickerView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        weekPicker.delegate = self
        weekPicker.dataSource = self
        label.text = "(月)"
        selectedWeek = "(月)"
    }
    
    
    //UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weekList.count
    }
    
    //UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weekList[row]
    }
    
    //UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        label.text = weekList[row]
        selectedWeek = weekList[row]
        print(selectedWeek)
        label.text = selectedWeek
//        self.present(toDoViewController, animated: Bool, completion: nil)
        
        
    }
    
    //
    //    //segueを呼び出すときに必要なメソッド
    func performSegueToToDo() {
        performSegue(withIdentifier: "toToDoViewController", sender: nil)
    }
    
    //    //segueを呼び出すときに必要なメソッド
    func performSegueToTableViewController() {
        performSegue(withIdentifier: "toTableViewController", sender: nil)
    }
    
    //segueを準備するとき呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toToDoViewController"{
            let toDoViewController = segue.destination as! ToDoViewController
            toDoViewController.selectedWeek = self.selectedWeek as! String
        }else if segue.identifier == "toTableViewController"{
            let toTableViewController = segue.destination as! TableViewController
            toTableViewController.selectedWeek = self.selectedWeek as! String
        }
    }
    
   
  
    @IBAction func add(){
            performSegueToToDo()
    }
    
    @IBAction func ToDoList(){
        performSegueToTableViewController()
    }
    
    
}

