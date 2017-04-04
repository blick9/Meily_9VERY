//
//  ViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var isActivate = (email : false, pw : false)

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitElement()
    }
    
    func setInitElement() {
        statusButton(isActivate: false)
        emailTextField.addTarget(self, action: #selector(emailValidate(email:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordValidate(password:)), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func emailValidate(email : UITextField) {
        if email.text?.isEmpty == true {
            isActivate.email = false
            checkEnableLogInButton()
        } else {
            isActivate.email = true
            checkEnableLogInButton()
        }
    }
    
    func passwordValidate(password : UITextField) {
        if password.text?.isEmpty == true {
            isActivate.pw = false
            checkEnableLogInButton()
        } else {
            isActivate.pw = true
            checkEnableLogInButton()
        }
    }
    

    @IBAction func logInActionButton(_ sender: Any) {
        let loginUser = User(email: emailTextField.text!, password: passwordTextField.text!)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = CustomTabBarController()
    }
    
    func checkEnableLogInButton() {
        if isActivate.email == true && isActivate.pw == true {
            statusButton(isActivate: true)
        } else {
            statusButton(isActivate: false)
        }
    }
    
    func statusButton(isActivate: Bool) {
        if isActivate == false {
            logInButton.isEnabled = false
            logInButton.isHighlighted = true
        } else {
            logInButton.isEnabled = true
            logInButton.isHighlighted = false
        }
    }
    
    func activityIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
}

