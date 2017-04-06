//
//  DailyTaskViewController.swift
//  Maily
//
//  Created by Danb on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class DailyTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dailyTable: UITableView!
    @IBOutlet weak var dailyAddButton: UIButton!
    
    var dailyArray = ["I'm gonna read ~80p before sleep", "영어 문법 2강까지 정리할꼬야 내가 다 할꼬야"]
    var goalArray = ["[글쓰기 특강 완독]","[기초문법책 매일 1강씩 공부]"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyTable.dataSource = self
        dailyTable.delegate = self
        dailyTable.reloadData()
        
      //  self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DailyTaskTableViewCell
        cell.dailyTaskLabel.text = dailyArray[indexPath.row]
        cell.dailyTaskGoal.text = goalArray[indexPath.row]
        
        return cell
        
    }
    
    
   /* func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dailyArray.remove(at: indexPath.row)
            tableView.deleteRows (at: [indexPath] , with: .fade)
        }
        else if editingStyle == .insert {
        }
    }
 */
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction  = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            print("Share Button tapped. Row item value = \(self.dailyArray[indexPath.row])")
            self.editSegue(indexPath: indexPath)
        }
        
        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (rowAction, indexPath) in
            print("Delete Button tapped. Row item value = \(self.dailyArray[indexPath.row])")
            self.dailyArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor.init(red: 255/255, green: 140/255, blue: 155/255, alpha: 1)
        editAction.backgroundColor = UIColor.init(red: 110/255, green: 175/255, blue: 255/255, alpha: 1)
        return [deleteAction, editAction]
    }
    
    func editSegue (indexPath: IndexPath) {
        
    }
    
    /*
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let dailyTask = dailyArray[sourceIndexPath.row]
        dailyArray.remove(at: sourceIndexPath.row)
        dailyArray.insert(dailyTask, at: destinationIndexPath.row)
        
    }
  */
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
