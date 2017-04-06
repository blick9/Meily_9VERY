//
//  DailyTaskAddViewController.swift
//  Maily
//
//  Created by nueola on 2017. 4. 4..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class DailyTaskAddViewController: UIViewController,UITextViewDelegate, UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    let dateFormatter = DateFormatter()
    let datePicker = UIDatePicker()
    let today = Date()
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var goalPicker: UIPickerView!
    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var dailyTaskMemo: UITextView!
    @IBOutlet weak var datePickerBackground: UIView!
    
    var bigGoalArray = ["aaaeeeggg","wwweeeeeww","wgegwwweggg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        setMemo()
        dateFormatter.locale = Locale(identifier: "ko_KR")
//        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "YYYY년 MM월 dd일, EEEE"
        datePickerTextField.textColor = UIColor.white
//        init(red: 246/255, green: 186/255, blue: 207/255, alpha: 1)
        datePickerTextField.text = dateFormatter.string(from: today)
        datePickerTextField.borderStyle = .none
        
        taskTitleTextField.attributedPlaceholder = NSAttributedString(string: "Choose BigGoal", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        

        dailyTaskMemo.layer.borderColor = UIColor.init(red: 204/255, green: 204/255, blue: 204/255, alpha: 0.2).cgColor
        dailyTaskMemo.layer.borderWidth = 1
        
        goalPicker.backgroundColor = UIColor.init(red: 59/255, green: 59/255, blue: 59/255, alpha: 1)
        goalPicker.tintColor = UIColor.white
        goalPicker.isHidden = true
        

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "Describe today your Promise :)") {
            textView.text = ""
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Describe today your Promise :)"
            textView.textColor = UIColor.darkGray
        }
        textView.resignFirstResponder()
    }
    
    
    
    @IBAction func cancleButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setMemo() {
         dailyTaskMemo.layer.cornerRadius = 5
    }

    
    func setDatePicker() {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: false)
        
        datePickerTextField.inputAccessoryView = toolbar
        datePickerTextField.inputView = datePicker
//        datePickerTextField.setValue(UIColor.white, forKey:"textColor")
    }
    
    func donePressed() {
        let selectedYear = datePicker.date
        datePickerTextField.text = dateFormatter.string(from: selectedYear)
        self.view.endEditing(true)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bigGoalArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bigGoalArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.taskTitleTextField.text = self.bigGoalArray[row]
        self.goalPicker.isHidden = true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.taskTitleTextField {
            self.goalPicker.isHidden = false
        }
        else {
            self.goalPicker.isHidden = true
        }
    }
    
    

    


}
