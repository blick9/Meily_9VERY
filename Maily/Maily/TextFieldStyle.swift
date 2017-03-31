//
//  TextFieldStyle.swift
//  Maily
//
//  Created by Febrix on 2017. 3. 30..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class TextFieldStyle: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = CGFloat(self.frame.height / 4)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.textColor = UIColor.white
        self.backgroundColor = UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName: UIColor.gray])
    }
}
