//
//  DB.swift
//  Maily
//
//  Created by Febrix on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit
import Foundation

class User {
    private var email : String
    private var password : String
    private var confirmPassword : String?
    init(email : String, password : String, confirmPassword : String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }
    
    init(email : String, password : String) {
        self.email = email
        self.password = password
        self.confirmPassword = nil
    }
}

class Goal {
    enum color {
        case yellow
        case green, blue, purple, pink
    }
    enum pictogram {
        case book
        case pencil, exercise, clock, shopping, money
    }
    fileprivate var image : UIImage
    fileprivate var goalTitle : String
    fileprivate var dueDate : Date
    fileprivate var priority : Int
    fileprivate var colorTag : color
    fileprivate var pictogram : pictogram
    fileprivate var idValue : String

    init(image : UIImage, title : String, dueDate : Date, priority : Int, colorTag : color, pictogram : pictogram, id : String) {
        self.image = image
        self.goalTitle = title
        self.dueDate = dueDate
        self.priority = priority
        self.colorTag = colorTag
        self.pictogram = pictogram
        self.idValue = id
    }
}

class DailyMemo {
    fileprivate var bigGoalId : String
    fileprivate var writeDate : Date
    fileprivate var todayPurposeMemo : String
    fileprivate var idValue : String
    
    init(bigGoalId : String, writeDate : Date, todayPurposeMemo : String, id : String) {
        self.bigGoalId = bigGoalId
        self.writeDate = writeDate
        self.todayPurposeMemo = todayPurposeMemo
        self.idValue = id
    }
}

class DataBase {
    static let sharedInstance : DataBase = {
        let instance = DataBase()
        return instance
    }()
    
    private var userID = String()
    private var goalDataArray = [Goal]()
    private var dailyMemoDataArray = [DailyMemo]()
    
    
    func addGoalData(goalData : Goal) {
        goalDataArray.append(goalData)
    }
    
    func addDailyMemoData(dailyMemo : DailyMemo) {
        dailyMemoDataArray.append(dailyMemo)
    }
    
    func getGoalDataArray() -> [[String:Any]] {
        var tempArray = [Any]()
        for i in goalDataArray {
            var tempDic = [String:Any]()
            tempDic["image"] = i.image
            tempDic["goalTitle"] = i.goalTitle
            tempDic["dueDate"] = i.dueDate
            tempDic["colorTag"] = i.colorTag
            tempDic["pictogram"] = i.pictogram
            tempDic["priority"] = i.priority
            tempDic["id"] = i.idValue
            tempArray.append(tempDic)
        }
        return tempArray as! [[String : Any]]
    }
    
    func getDailyMemoDataArray() -> [[String:Any]] {
        var tempArray = [Any]()
        for i in dailyMemoDataArray {
            var tempDic = [String:Any]()
            tempDic["bigGoalId"] = i.bigGoalId
            tempDic["writeDate"] = i.writeDate
            tempDic["todayPurposeMemo"] = i.todayPurposeMemo
            tempDic["colidValueorTag"] = i.idValue
            tempArray.append(tempDic)
        }
        return tempArray as! [[String : Any]]
    }
    
    func getGoalDataByID(goalID : String) -> [String:Any] {
        var tempDic = [String:Any]()
        for i in goalDataArray {
            if i.idValue == goalID {
                tempDic["image"] = i.image
                tempDic["goalTitle"] = i.goalTitle
                tempDic["dueDate"] = i.dueDate
                tempDic["colorTag"] = i.colorTag
                tempDic["pictogram"] = i.pictogram
                tempDic["priority"] = i.priority
                tempDic["id"] = i.idValue
            }
        }
        return tempDic
    }
    
    func removeDailyMemoDataArray(index : Int) {
        dailyMemoDataArray.remove(at: index)
    }
    
    func removeGoalDataArray(index : Int) {
        goalDataArray.remove(at: index)
    }
}
