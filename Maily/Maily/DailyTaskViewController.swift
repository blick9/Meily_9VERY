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
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataBase.sharedInstance.removeDailyMemoDataArray(index: indexPath.row)
            tableView.deleteRows (at: [indexPath] , with: .fade)
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
