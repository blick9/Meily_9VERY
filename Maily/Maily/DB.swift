//
//  DB.swift
//  Maily
//
//  Created by Febrix on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit
import Foundation

class Goal {
    private var goalTitle : String
    private var dueDate : NSDate
    private var priority : Int
    private var colorTag : UIColor
    private var pictogram : UIImage

    init(title : String, dueDate : NSDate, priority : Int, colorTag : UIColor, pictogram : UIImage) {
        self.goalTitle = title
        self.dueDate = dueDate
        self.priority = priority
        self.colorTag = colorTag
        self.pictogram = pictogram
    }
}

class DailyMemo {
    private var goal : Goal
    private var writeDate : NSDate
    private var memoContents : String
    
    init(goal : Goal, writeDate : NSDate, memoContents : String) {
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
