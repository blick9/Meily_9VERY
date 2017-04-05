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
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
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
