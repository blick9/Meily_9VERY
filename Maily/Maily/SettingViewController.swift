//
//  SettingViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkCurrentUser()
    }

    func checkCurrentUser() {
        if DataBase.sharedInstance.getCurrentUserEmail() == nil {
            emailLabel.text = "로그인 정보가 없습니다."
        } else {
            emailLabel.text = DataBase.sharedInstance.getCurrentUserEmail()
            DataBase.sharedInstance.getCurrentUserEmail()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let loginSB = UIStoryboard(name: "Login", bundle: nil)
        let loginVC = loginSB.instantiateViewController(withIdentifier: "LoginMain") as? LoginViewController
        appDelegate.window?.rootViewController = loginVC

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
