//
//  GoalAddViewController.swift
//  Maily
//
//  Created by nueola on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class GoalAddViewController: UIViewController {
    let dateFormatter = DateFormatter()
    let datePicker = UIDatePicker()

    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var priority3Button: UIButton!
    @IBOutlet weak var priority2Button: UIButton!
    @IBOutlet weak var priority1Button: UIButton!
   
    @IBOutlet weak var categoryBackground: UIView!
    @IBOutlet weak var colorChipBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        categoryBackground.layer.cornerRadius = CGFloat(categoryBackground.frame.height/2)
        colorChipBackground.layer.cornerRadius = CGFloat(colorChipBackground.frame.height/2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//         datePickerTextField.setValue(UIColor.white, forKey:"textColor")
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
