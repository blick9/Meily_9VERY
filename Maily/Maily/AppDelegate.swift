//
//  AppDelegate.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let isLogin = false
        
        
//        if isLogin == false {
//            let loginSB = UIStoryboard(name: "Login", bundle: nil)
//            let loginVC = loginSB.instantiateViewController(withIdentifier: "LoginMain") as? LoginViewController
//            self.window?.rootViewController = loginVC
//        } else {
//            let goalCollectionSB = UIStoryboard(name: "Goal_collection", bundle: nil)
//            let goalCollectionVC = goalCollectionSB.instantiateViewController(withIdentifier: "MainTab")
////            let collectionVC = UINavigationController(rootViewController: goalCollectionVC)
//            self.window?.rootViewController = goalCollectionVC
//        }
        
        // Change NavigationBar Design
//        let image = UIImage(named: "TopBar")
        UINavigationBar.appearance().tintColor = UIColor(red: 245/255, green: 170/255, blue: 197/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.black
        
        // Translucent.
//        UINavigationBar.appearance().isTranslucent = true
        
        // Remove line of navigation bar
//        UINavigationBar.appearance().shadowImage = UIImage()
        //        UINavigationBar.appearance().setBackgroundImage(nil, for: .default)
        
        // Change TabBar Design
        UITabBar.appearance().tintColor = UIColor(red: 248/255, green: 187/255, blue: 208/255, alpha: 1)
        UITabBar.appearance().barTintColor = UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1)
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

