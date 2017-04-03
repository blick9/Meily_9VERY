//
//  CustomTabBarController.swift
//  Maily
//
//  Created by Febrix on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class CustomTabBarController : UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let goalCollectionSB = UIStoryboard(name: "Goal_collection", bundle: nil)
        let loginSB = UIStoryboard(name: "Login", bundle: nil)
//        goalCollectionSB
        
        viewControllers = []
        removeTabBarTextItems()

    }
    func removeTabBarTextItems() {
        if let items = tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
            }
        }
    }
}
