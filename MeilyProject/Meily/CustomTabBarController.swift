//
//  CustomTabBarController.swift
//  Maily
//
//  Created by Febrix on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class CustomTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false

        let loginSB = UIStoryboard(name: "Login", bundle: nil)
        let dailyTaskSB = UIStoryboard(name: "Task_table", bundle: nil)
        let goalCollectionSB = UIStoryboard(name: "Goal_collection", bundle: nil)
        let settingSB = UIStoryboard(name: "Setting", bundle: nil)
        
        // Task Table View
        let dailyTaskVC = dailyTaskSB.instantiateViewController(withIdentifier: "TaskMain")
        dailyTaskVC.tabBarItem.image = UIImage(named: "Tap_Daily")
//        postViewController.tabBarItem.image = UIImage(named: "Post")?.withRenderingMode(.alwaysOriginal)
        
        // Goal Collection View
        let goalCollectionVC = goalCollectionSB.instantiateViewController(withIdentifier: "MainTab")
        goalCollectionVC.tabBarItem.image = UIImage(named: "Tap_Goal")//?.withRenderingMode(.alwaysOriginal)
        
        // Setting View
        let settingVC = settingSB.instantiateViewController(withIdentifier: "SettingMain")
        settingVC.tabBarItem.image = UIImage(named: "Tap_Setting")
        
        viewControllers = [dailyTaskVC, goalCollectionVC, settingVC]
        removeTabBarTextItems()
    }
    
    // remove text field
    func removeTabBarTextItems() {
        if let items = tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
            }
        }
    }
}
