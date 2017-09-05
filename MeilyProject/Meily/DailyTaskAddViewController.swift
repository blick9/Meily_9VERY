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
    let pickerView = UIPickerView()
    let today = Date()
    var selectGoalIdValue = String()

    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var goalPicker: UIPickerView!
    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var bigGoalTextField: UITextField!
    @IBOutlet weak var todayPurposeMemoTextView: UITextView!
    @IBOutlet weak var datePickerBackground: UIView!
    
    var bigGoalArray = ["aaaeeeggg","wwweeeeeww","wgegwwweggg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setDatePicker()
        setGoalPicker()
        setMemo()
        dateFormatter.locale = Locale(identifier: "ko_KR")
//        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "YYYY년 MM월 dd일, EEEE"
        datePickerTextField.textColor = UIColor.white
//        init(red: 246/255, green: 186/255, blue: 207/255, alpha: 1)
        datePickerTextField.text = dateFormatter.string(from: today)
        datePickerTextField.borderStyle = .none
        
        bigGoalTextField.attributedPlaceholder = NSAttributedString(string: "Choose BigGoal", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        bigGoalTextField.borderStyle = .none
        


        todayPurposeMemoTextView.layer.borderColor = UIColor.init(red: 204/255, green: 204/255, blue: 204/255, alpha: 0.2).cgColor
        todayPurposeMemoTextView.layer.borderWidth = 1
        
//        goalPicker.backgroundColor = UIColor.init(red: 59/255, green: 59/255, blue: 59/255, alpha: 1)
//        goalPicker.tintColor = UIColor.white
//        goalPicker.isHidden = true
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
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataBase.sharedInstance.getGoalDataArray().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let goalDataArray = DataBase.sharedInstance.getGoalDataArray()
        return goalDataArray[row]["goalTitle"] as! String?
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let goalDataArray = DataBase.sharedInstance.getGoalDataArray()
        bigGoalTextField.text = goalDataArray[row]["goalTitle"] as! String?
        selectGoalIdValue = goalDataArray[row]["id"] as! String
    }
    
    @IBAction func cancleButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setMemo() {
         todayPurposeMemoTextView.layer.cornerRadius = 5
    }

    func setGoalPicker() {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(goalPickerDonePressed))
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: false)
        
        bigGoalTextField.inputAccessoryView = toolbar
        bigGoalTextField.inputView = pickerView
    }
    
    func goalPickerDonePressed() {
        self.view.endEditing(true)
    }
    
    func setDatePicker() {
        let toolbar = UIToolbar()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePickerDonePressed))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko_KR")
        toolbar.sizeToFit()
        toolbar.setItems([doneButton], animated: false)
        
        datePickerTextField.inputAccessoryView = toolbar
        datePickerTextField.inputView = datePicker
//        datePickerTextField.setValue(UIColor.white, forKey:"textColor")
    }
    
    func datePickerDonePressed() {
        let selectedYear = datePicker.date
        datePickerTextField.text = dateFormatter.string(from: selectedYear)
        self.view.endEditing(true)
    }
    
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return bigGoalArray.count
//    }
//    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return bigGoalArray[row]
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.taskTitleTextField.text = self.bigGoalArray[row]
//        self.goalPicker.isHidden = true
//    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == self.taskTitleTextField {
//            self.goalPicker.isHidden = false
//        }
//        else {
//            self.goalPicker.isHidden = true
//        }
//    }
    

    @IBAction func saveButtonAction(_ sender: Any) {
        if bigGoalTextField.text?.isEmpty == true {
            presentAlert(title: "저장 에러", message: "목표를 선택해주세요.", isConfirm: true)
        } else if todayPurposeMemoTextView.text?.isEmpty == true {
            presentAlert(title: "저장 에러", message: "메모를 입력해주세요.", isConfirm: true)
        } else {
            let makeID = DateFormatter()
            makeID.dateFormat = "yymmddhhmmss"
            let addDailyMemoInstance = DailyMemo(bigGoalId: selectGoalIdValue, writeDate: datePicker.date, todayPurposeMemo: todayPurposeMemoTextView.text, id: makeID.string(from: Date()))
            
            DataBase.sharedInstance.addDailyMemoData(dailyMemo: addDailyMemoInstance)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadDailyMemoTableView"), object: nil)
            self.dismiss(animated: true, completion: nil)
            //            presentAlert(title: "저장 성공", message: "목표가 저장되었습니다.", isConfirm: false)
        }
    }
    
    
    func presentAlert(title : String, message : String, isConfirm : Bool) {
        if isConfirm == true {
            let existConfirmButtonAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .default, handler: nil)
            existConfirmButtonAlert.addAction(okButton)
            present(existConfirmButtonAlert, animated: true, completion: nil)
        } else {
            let normalAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            present(normalAlert, animated: true, completion: {
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
}
