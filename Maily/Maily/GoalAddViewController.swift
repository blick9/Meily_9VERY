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
    var priorityValue : Goal.Priority = .low
    var colorTagValue : Goal.Color = .blue
    var pictogramValue : Goal.Pictogram = .book
    
    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var goalTitleTextField: UITextField!
    @IBOutlet weak var categoryBackground: UIView!
    @IBOutlet weak var colorChipBackground: UIView!
    @IBOutlet weak var previewImage: UIImageView!
    
    @IBOutlet weak var colorYellowButton: UIButton!
    @IBOutlet weak var colorGreenButton: UIButton!
    @IBOutlet weak var colorBlueButton: UIButton!
    @IBOutlet weak var colorPurpleButton: UIButton!
    @IBOutlet weak var colorPinkButton: UIButton!
    
    @IBOutlet weak var pictoBookButton: UIButton!
    @IBOutlet weak var pictoPencleButton: UIButton!
    @IBOutlet weak var pictoExerciseButton: UIButton!
    @IBOutlet weak var pictoClockButton: UIButton!
    @IBOutlet weak var pictoShoppingButton: UIButton!
    @IBOutlet weak var pictoMoneyButton: UIButton!
    
    @IBOutlet weak var priority3Button: UIButton!
    @IBOutlet weak var priority2Button: UIButton!
    @IBOutlet weak var priority1Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        goalTitleTextField.attributedPlaceholder = NSAttributedString(string: "Write Your Goal!", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        datePickerTextField.attributedPlaceholder = NSAttributedString(string: "Select Due Date", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
        goalTitleTextField.borderStyle = .none
        relateButton()
    }
    
    func relateButton() {
        colorYellowButton.addTarget(self, action: #selector(colorButton(_:)), for: .touchUpInside)
        colorGreenButton.addTarget(self, action: #selector(colorButton(_:)), for: .touchUpInside)
        colorBlueButton.addTarget(self, action: #selector(colorButton(_:)), for: .touchUpInside)
        colorPurpleButton.addTarget(self, action: #selector(colorButton(_:)), for: .touchUpInside)
        colorPinkButton.addTarget(self, action: #selector(colorButton(_:)), for: .touchUpInside)
        
        pictoBookButton.addTarget(self, action: #selector(pictogramButton(_:)), for: .touchUpInside)
        pictoPencleButton.addTarget(self, action: #selector(pictogramButton(_:)), for: .touchUpInside)
        pictoExerciseButton.addTarget(self, action: #selector(pictogramButton(_:)), for: .touchUpInside)
        pictoClockButton.addTarget(self, action: #selector(pictogramButton(_:)), for: .touchUpInside)
        pictoShoppingButton.addTarget(self, action: #selector(pictogramButton(_:)), for: .touchUpInside)
        pictoMoneyButton.addTarget(self, action: #selector(pictogramButton(_:)), for: .touchUpInside)
        
        priority3Button.addTarget(self, action: #selector(priorityButton(_:)), for: .touchUpInside)
        priority2Button.addTarget(self, action: #selector(priorityButton(_:)), for: .touchUpInside)
        priority1Button.addTarget(self, action: #selector(priorityButton(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancleButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func colorButton(_ button:UIButton) {
        switch button.tag {
        case 1:
            colorTagValue = .yellow
        case 2:
            colorTagValue = .green
        case 3:
            colorTagValue = .blue
        case 4:
            colorTagValue = .purple
        case 5:
            colorTagValue = .pink
        default :
            break
        }
    }
    
    func pictogramButton(_ button:UIButton) {
        button.isSelected = !button.isSelected
        button.alpha = button.isSelected ? 1 : 0.5
        switch button.tag {
        case 1:
            pictogramValue = .book
        case 2:
            pictogramValue = .pencil
        case 3:
            pictogramValue = .exercise
        case 4:
            pictogramValue = .clock
        case 5:
            pictogramValue = .shopping
        case 6:
            pictogramValue = .money
        default :
            break
        }
    }

    
    func priorityButton(_ button:UIButton) {
        button.isSelected = !button.isSelected
        switch button.tag {
        case 3:
            priorityValue = .high
        case 2:
            priorityValue = .middle
        case 1:
            priorityValue = .low
        default :
            break
        }
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
            var addGoalDataInstance = Goal(image: previewImage.image!, title: goalTitleTextField.text!, dueDate: datePicker.date, priority: priorityValue, colorTag: colorTagValue, pictogram: pictogramValue, id: makeID.string(from: Date()))
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
