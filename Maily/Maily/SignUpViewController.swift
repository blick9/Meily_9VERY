//
//  SignUpViewController.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var noticeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitElement()
        passwordTextField.addTarget(self, action: #selector(passwordVaildator(password:)), for: .editingChanged)
    }
    
    func setInitElement() {
        statusButton(isActivate: false)
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
    
    
    func passwordVaildator(password: UITextField) {
        print(password.text)
        if (password.text?.unicodeScalars.count)! >= 4 {
            statusButton(isActivate: true)
            noticeLabel.text = ""
        } else {
            statusButton(isActivate: false)
            noticeLabel.text = "비밀번호는 4자리 이상으로 입력해주세요."
        }
    }
    
    func indicatePasswordNotice(password: String) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
