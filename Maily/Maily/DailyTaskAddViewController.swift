//
//  DailyTaskAddViewController.swift
//  Maily
//
//  Created by nueola on 2017. 4. 4..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class DailyTaskAddViewController: UIViewController {
    let dateFormatter = DateFormatter()
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var priority3Button: UIButton!
    @IBOutlet weak var priority2Button: UIButton!
    @IBOutlet weak var priority1Button: UIButton!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
    }
    @IBAction func cancleButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        datePickerTextField.setValue(UIColor.white, forKey:"textColor")
    }
 
    
    func donePressed() {
        let selectedYear = datePicker.date
        dateFormatter.dateFormat = "YYYY년 MM월 dd일(EEEE)"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        //        dateFormatter.dateStyle = .full
        //        dateFormatter.timeStyle = .none
        datePickerTextField.text = dateFormatter.string(from: selectedYear)
        self.view.endEditing(true)
    }


}
