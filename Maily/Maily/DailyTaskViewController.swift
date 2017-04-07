//
//  DailyTaskViewController.swift
//  Maily
//
//  Created by Danb on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit
import Foundation

class DailyTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dailyTable: UITableView!
    @IBOutlet weak var dailyAddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyTable.dataSource = self
        dailyTable.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableViewData), name: NSNotification.Name(rawValue: "reloadDailyMemoTableView"), object: nil)
      //  self.navigationItem.rightBarButtonItem = self.editButtonItem
        // Do any additional setup after loading the view.
    }
    
    func reloadTableViewData() {
        dailyTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataBase.sharedInstance.getDailyMemoDataArray().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DailyTaskTableViewCell
        let dailyMemoDataFromDB = DataBase.sharedInstance.getDailyMemoDataArray()
        let bigGoalID = dailyMemoDataFromDB[indexPath.row]["bigGoalId"] as! String?
        let bigGoalDataDic = DataBase.sharedInstance.getGoalDataByID(goalID: bigGoalID!)
        let pictogram = bigGoalDataDic["pictogram"] as? Goal.Pictogram
        let colorTag = bigGoalDataDic["colorTag"] as? Goal.Color
        let priorityStar = bigGoalDataDic["priority"] as? Goal.Priority
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd"
        
        cell.dailyTaskGoal.text = ("<\((bigGoalDataDic["goalTitle"] as! String?)!)>")
        cell.dailyTaskLabel.text = dailyMemoDataFromDB[indexPath.row]["todayPurposeMemo"] as! String?
        cell.dailyTaskDate.text = dateFormatter.string(from: dailyMemoDataFromDB[indexPath.row]["writeDate"] as! Date)
        cell.dailyTaskIcon.image = pictogram?.applyPictogram()
        cell.dailyTaskColorBar.backgroundColor = colorTag?.applyColor()
        cell.dailyTaskGoalPriority.text = priorityStar?.convertStar()
        return cell
        
    }
    
    
   /* func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataBase.sharedInstance.removeDailyMemoDataArray(index: indexPath.row)
            tableView.deleteRows (at: [indexPath] , with: .fade)
        }
        else if editingStyle == .insert {
        }
    }
 */
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction  = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
//            print("Share Button tapped. Row item value = \(self.dailyArray[indexPath.row])")
            self.editSegue(indexPath: indexPath)
        }
        
        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (rowAction, indexPath) in
//            print("Delete Button tapped. Row item value = \(self.dailyArray[indexPath.row])")
//            self.dailyArray.remove(at: indexPath.row)
            DataBase.sharedInstance.removeDailyMemoDataArray(index: indexPath.row)
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
