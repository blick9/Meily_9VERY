//
//  ViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setInitElement()
    }
    
    func setInitElement() {
        logInButton.isEnabled = false
        logInButton.isHighlighted = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logInActionButton(_ sender: Any) {
        let email = valueValidate(value: emailTextField)
        let password = valueValidate(value: passwordTextField)
        
        if email == true && password == true {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)

            let goalCollectionSB = UIStoryboard(name: "Goal_collection", bundle: nil)
            let goalCollectionVC = goalCollectionSB.instantiateViewController(withIdentifier: "MainTab")
//            let test = UINavigationController(rootViewController: goalCollectionVC)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = goalCollectionVC
        }
    }
    
    func valueValidate(value : UITextField) -> Bool {
        if value.text?.isEmpty == true {
            return false
        } else {
            return true
        }
    }
}

