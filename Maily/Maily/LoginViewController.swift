//
//  ViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    var isActivated = (email : false, pw : false)
    
    // Make Underline
    var attrs = [NSFontAttributeName : UIFont.systemFont(ofSize: 25),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    var attributedString = NSMutableAttributedString(string:"")

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    //TODO: Make Apply Filter Action
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let buttonTitleStr = NSMutableAttributedString(string: "Sign Up", attributes:attrs)
        attributedString.append(buttonTitleStr)
        signUpButton.setAttributedTitle(buttonTitleStr, for: .normal)
        
        statusButton(isActivated: false)
        emailTextField.addTarget(self, action: #selector(emailValidate(email:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordValidate(password:)), for: .editingChanged)
        
//        tempLoginSkipButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Validate Input TextField
    func emailValidate(email : UITextField) {
        if email.text?.isEmpty == true {
            isActivated.email = false
            checkEnableLogInButton()
        } else {
            isActivated.email = true
            checkEnableLogInButton()
        }
    }
    
    func passwordValidate(password : UITextField) {
        if password.text?.isEmpty == true {
            isActivated.pw = false
            checkEnableLogInButton()
        } else {
            isActivated.pw = true
            checkEnableLogInButton()
        }
    }
    // MARK:-

    
    @IBAction func logInActionButton(_ sender: Any) {
        let emailValue = emailTextField.text
        let passwordValue = passwordTextField.text
        
        LogIn(email: emailValue!, password: passwordValue!) { (statusCode) in
            switch statusCode {
            case 404 :
                // 존재하지 않는 이메일
                self.presentAlert(title: "로그인 실패", message: "존재하지 않는 이메일입니다.\n회원가입 후 이용해주세요.", isLogin: false)
            case 406 :
                // 비밀번호
                self.presentAlert(title: "로그인 실패", message: "비밀번호가 일치하지 않습니다.\n다시 시도해주세요.", isLogin: false)
            case 200 :
                // 성공
                self.presentAlert(title: "로그인 성공", message: "", isLogin: true)
                DataBase.sharedInstance.setCurrentUser(email: emailValue!)
                self.successLogIn(LogInID: emailValue!, completion: { (string) in
                    DataBase.sharedInstance.setCurrentUser(email: emailValue!)
                })
                self.switchViewToMain()
            default:
                break
            }
        }
    }
    
    // 로그인 성공 시 서버로 전송하는 값
    func successLogIn(LogInID : String, completion : @escaping (String)-> Void) {
        let parameter = ["email" : LogInID]
        Alamofire.request("http://127.0.0.1:8080/api/login/certifylogin", method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseString { (response) in
            completion(response.description)
        }
    }
    
    func LogIn(email : String, password : String, completion : @escaping (Int) -> Void) {
        let parameter = ["email":email, "password":password]
        Alamofire.request("http://127.0.0.1:8080/api/user/login", method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).response { (Response) in
            let statusCode = (Response.response?.statusCode)!
            completion(statusCode)
        }
    }
    
    func presentAlert(title : String, message : String, isLogin : Bool) {
        if isLogin == false {
            let existOkButtonAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
            existOkButtonAlert.addAction(okButton)
            present(existOkButtonAlert, animated: true, completion: nil)
        } else {
            let normalAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            present(normalAlert, animated: true, completion: {
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    func checkEnableLogInButton() {
        if isActivated.email == true && isActivated.pw == true {
            statusButton(isActivated: true)
        } else {
            statusButton(isActivated: false)
        }
    }
    
    func statusButton(isActivated: Bool) {
        if isActivated == false {
            logInButton.isEnabled = false
            logInButton.isHighlighted = true
        } else {
            logInButton.isEnabled = true
            logInButton.isHighlighted = false
        }
    }
    
    func switchViewToMain() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = CustomTabBarController()
    }
    
    //MARK: NOT USE
    func activityIndicator() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func tempLoginSkipButton() {
        var skipButton = UIButton(frame: CGRect(x: self.view.center.x, y: 200, width: 100, height: 100))
        skipButton.setTitle("Skip Button", for: .normal)
        skipButton.setTitleColor(UIColor.red, for: .normal)
        skipButton.addTarget(self, action: #selector(switchViewToMain), for: .touchUpInside)
        self.view.addSubview(skipButton)
    }
}

