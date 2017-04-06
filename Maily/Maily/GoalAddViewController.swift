//
//  GoalAddViewController.swift
//  Maily
//
//  Created by nueola on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class GoalAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let dateFormatter = DateFormatter()
    let datePicker = UIDatePicker()
    

    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var priority3Button: UIButton!
    @IBOutlet weak var priority2Button: UIButton!
    @IBOutlet weak var priority1Button: UIButton!
   
    @IBOutlet weak var categoryBackground: UIView!
    @IBOutlet weak var colorChipBackground: UIView!
    
    @IBOutlet weak var previewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        goalTitleTextField.attributedPlaceholder = NSAttributedString(string: "Write Your Goal!", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        datePickerTextField.attributedPlaceholder = NSAttributedString(string: "Select Due Date", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        goalTitleTextField.borderStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancleButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 컬러버튼 하나 픽업 구현
    // 픽토그램 하나 픽업 구현
    // 우선순위 하나 픽업 구현
    
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
        dateFormatter.dateFormat = "YYYY년 MM월 dd일(EE) 까지"
        dateFormatter.locale = Locale(identifier: "ko_KR")
//        dateFormatter.dateStyle = .full
//        dateFormatter.timeStyle = .none
        datePickerTextField.text = dateFormatter.string(from: selectedYear)
        self.view.endEditing(true)
    }

    @IBAction func imagePickButton(_ sender: Any) {
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.sourceType = .photoLibrary
        present(imagepicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            previewImage.image = image as! UIImage
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if goalTitleTextField.text?.isEmpty == true {
            presentAlert(title: "저장 에러", message: "목표명을 입력해주세요.", isConfirm: true)
        } else if datePickerTextField.text?.isEmpty == true {
            presentAlert(title: "저장 에러", message: "기한을 정해주세요.", isConfirm: true)
        } else {
            var makeID = DateFormatter()
            makeID.dateFormat = "yymmddhhmmss"
            var addGoalDataInstance = Goal(image: previewImage.image!, title: goalTitleTextField.text!, dueDate: datePicker.date, priority: 1, colorTag: .blue, pictogram: .book, id: makeID.string(from: Date()))
            DataBase.sharedInstance.addGoalData(goalData: addGoalDataInstance)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadGoalCollectionView"), object: nil)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
