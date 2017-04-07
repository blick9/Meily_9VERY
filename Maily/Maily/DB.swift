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
    enum Color {
        case yellow, green, blue, purple, pink
        func applyColor() -> UIColor {
            switch self {
            case .yellow:
                return UIColor(red: 255/255, green: 253/255, blue: 163/255, alpha: 1)
            case .green:
                return UIColor(red: 163/255, green: 255/255, blue: 163/255, alpha: 1)
            case .blue:
                return UIColor(red: 163/255, green: 242/255, blue: 255/255, alpha: 1)
            case .purple:
                return UIColor(red: 187/255, green: 163/255, blue: 255/255, alpha: 1)
            case .pink:
                return UIColor(red: 255/255, green: 163/255, blue: 247/255, alpha: 1)
            }
        }
    }
    
    enum Pictogram {
        case book, pencil, exercise, clock, shopping, money
        func applyPictogram() -> UIImage {
            switch self {
            case .book:
                return #imageLiteral(resourceName: "book_icon")
            case .pencil:
                return #imageLiteral(resourceName: "pencil_icon")
            case .exercise:
                return #imageLiteral(resourceName: "exercise_icon")
            case .clock:
                return #imageLiteral(resourceName: "clock_icon")
            case .shopping:
                return #imageLiteral(resourceName: "shopping_icon")
            case .money:
                return #imageLiteral(resourceName: "money_icon")
            }
        }
    }
    
    enum Priority {
        case high
        case middle
        case low
        func convertStar() -> String {
            switch self {
            case .high:
                return "★★★"
            case .middle:
                return "★★"
            case .low:
                return "★"
            }
        }
    }
    
    fileprivate var image : UIImage
    fileprivate var goalTitle : String
    fileprivate var dueDate : Date
    fileprivate var priority : Priority
    fileprivate var colorTag : Color
    fileprivate var pictogram : Pictogram
    fileprivate var idValue : String

    init(image : UIImage, title : String, dueDate : Date, priority : Priority, colorTag : Color, pictogram : Pictogram, id : String) {
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
    
    private var currentUserEmail : String?
    private var goalDataArray = [Goal]()
    private var dailyMemoDataArray = [DailyMemo]()
    
    
    func addGoalData(goalData : Goal) {
        goalDataArray.append(goalData)
    }
    
    func addDailyMemoData(dailyMemo : DailyMemo) {
        dailyMemoDataArray.append(dailyMemo)
    }
    
    func setCurrentUser(email : String) {
        currentUserEmail = email
    }
    
    func getCurrentUserEmail() -> String? {
        return currentUserEmail
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
