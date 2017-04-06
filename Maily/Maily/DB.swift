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
    private var image : UIImage
    private var goalTitle : String
    private var dueDate : Date
    private var priority : Int
    private var colorTag : color
    private var pictogram : pictogram

    init(image : UIImage, title : String, dueDate : Date, priority : Int, colorTag : color, pictogram : pictogram) {
        self.image = image
        self.goalTitle = title
        self.dueDate = dueDate
        self.priority = priority
        self.colorTag = colorTag
        self.pictogram = pictogram
    }
}

class DailyMemo {
    private var goal : Goal
    private var writeDate : Date
    private var memoContents : String
    
    init(goal : Goal, writeDate : Date, memoContents : String) {
        self.goal = goal
        self.writeDate = writeDate
        self.memoContents = memoContents
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
    
    func getGoalDataArray() -> [Goal] {
        return goalDataArray
    }
    
    func getDailyMemoDataArray() -> [DailyMemo] {
        return dailyMemoDataArray
    }
}
