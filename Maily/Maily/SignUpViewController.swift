//
//  SignUpViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var isActivate = (email : false, pw : false, confimPw : false)
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var noticeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitElement()
    }
    
    func setInitElement() {
        statusButton(isActivate: false)
        emailTextField.addTarget(self, action: #selector(emailValidate(email:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordValidate(password:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(confirmPasswordValidate(confirmPassword:)), for: .editingChanged)
    }
    
    func statusButton(isActivate: Bool) {
        if isActivate == false {
            signUpButton.isEnabled = false
            signUpButton.isHighlighted = true
        } else {
            signUpButton.isEnabled = true
            signUpButton.isHighlighted = false
        }
    }

    func emailValidate(email: UITextField) {
        if email.text?.unicodeScalars.isEmpty == false {
            isActivate.email = true
            indicateNotice(message: "")
        } else {
            isActivate.email = false
            indicateNotice(message: "E-mail을 입력해주세요.")
        }
    }

    func passwordValidate(password: UITextField) {

        let alphanumerics = CharacterSet.alphanumerics
        let digits = CharacterSet.decimalDigits
        
//        for char in (password.text?.unicodeScalars)! {
//            print(char)
//        }
        
        if (password.text?.unicodeScalars.count)! >= 4 { // 4자리 이상, 영문 + 숫자 포함
            isActivate.pw = true
            indicateNotice(message: "")
        } else {
            isActivate.pw = false
            indicateNotice(message: "비밀번호는 4자리 이상으로 입력해주세요.")
        }
    }
    
    func confirmPasswordValidate(confirmPassword: UITextField) {
        if confirmPassword.text == passwordTextField.text {
            isActivate.confimPw = true
            indicateNotice(message: "")
        } else {
            isActivate.confimPw = false
            indicateNotice(message: "비밀번호가 일치하지 않습니다.")
        }
    }
    
    func indicateNotice(message: String) {
        noticeLabel.text = message
        if isActivate.email == true && isActivate.pw == true && isActivate.confimPw == true {
            statusButton(isActivate: true)
        } else {
            statusButton(isActivate: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Button Action
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
