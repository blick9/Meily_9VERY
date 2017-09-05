//
//  SignUpViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    var isActivated = (email : false, pw : false, confimPw : false)
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var noticeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusButton(isActivated: false)
        emailTextField.addTarget(self, action: #selector(emailValidate(email:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordValidate(password:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(confirmPasswordValidate(confirmPassword:)), for: .editingChanged)
    }
    
    func statusButton(isActivated: Bool) {
        if isActivated == false {
            signUpButton.isEnabled = false
            signUpButton.isHighlighted = true
        } else {
            signUpButton.isEnabled = true
            signUpButton.isHighlighted = false
        }
    }

    func emailValidate(email: UITextField) {
        if let emailValue = email.text {
            isActivated.email = emailValue.unicodeScalars.isEmpty ? false : true
            indicateNoticeLabel(message: "")
            print("http://127.0.0.1:8080/api/user/list/\(emailValue)")
            
            if emailValue.unicodeScalars.contains("@") == false || emailValue.unicodeScalars.contains(".") == false {
                self.isActivated.email = false
                self.indicateNoticeLabel(message: "이메일 형식이 올바르지 않습니다.")
            } else {
                // TODO: Get func 분리
                Alamofire.request("http://127.0.0.1:8080/api/user/list/\(emailValue)").response { (Response) in
                    let statusCode = Response.response?.statusCode
                    switch statusCode! {
                    case 202 :
                        self.isActivated.email = true
                        self.indicateNoticeLabel(message: "가입할 수 있는 이메일입니다.")
                    case 409 :
                        self.isActivated.email = false
                        self.indicateNoticeLabel(message: "이미 등록된 이메일입니다.")
                    default:
                        break
                    }
                }
            }
        }
    }

    func passwordValidate(password: UITextField) {
//        print(password.text)
//        let alphanumerics = CharacterSet.alphanumerics
//        let digits = CharacterSet.decimalDigits
        
//        for char in (password.text?.unicodeScalars)! {
//            print(char)
//        }
        
        if (password.text?.unicodeScalars.count)! >= 4 { // TODO: 4자리 이상, 영문 + 숫자 포함
            isActivated.pw = true
            indicateNoticeLabel(message: "")
        } else {
            isActivated.pw = false
            indicateNoticeLabel(message: "비밀번호는 4자리 이상으로 입력해주세요.")
        }
    }
    
    func confirmPasswordValidate(confirmPassword: UITextField) {
        if confirmPassword.text == passwordTextField.text {
            isActivated.confimPw = true
            indicateNoticeLabel(message: "")
        } else {
            isActivated.confimPw = false
            indicateNoticeLabel(message: "비밀번호가 일치하지 않습니다.")
        }
    }
    
    func indicateNoticeLabel(message: String) {
        noticeLabel.text = message
        if isActivated.email == true && isActivated.pw == true && isActivated.confimPw == true {
            statusButton(isActivated: true)
        } else {
            statusButton(isActivated: false)
        }
    }
    
    func isCorrectPassword() -> Bool {
        var isCorrect = false
        if passwordTextField.text == confirmPasswordTextField.text {
            isCorrect = true
        } else {
            isCorrect = false
        }
        return isCorrect
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Button Action
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        let checkPassword = isCorrectPassword()
        let emailValue = emailTextField.text
        let confirmPasswordValue = confirmPasswordTextField.text
        
        if checkPassword == true {
            SignUp(email: emailValue!, password: confirmPasswordValue!, completion: { (statusCode) in
                switch statusCode {
                case 200:
                    self.presentAlert(title: "회원가입 성공", message: "회원가입을 축하드립니다!")
                case 409:
                    self.presentAlert(title: "회원가입 실패", message: "이미 존재하는 이메일입니다.")
                default:
                    break
                }
            })
        } else {
            isActivated.confimPw = false
            indicateNoticeLabel(message: "비밀번호가 일치하지 않습니다.")
        }
    }
    
    func presentAlert(title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
    // 제이슨으로 이메일, 패스워드 넘기기 성공
    func SignUp(email : String, password : String, completion : @escaping (Int) -> Void) {
        let parameter = ["email":email, "password":password]
        Alamofire.request("http://127.0.0.1:8080/api/user/register", method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).response { (Response) in
            let statusCode = (Response.response?.statusCode)!
            completion(statusCode)
        }
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
