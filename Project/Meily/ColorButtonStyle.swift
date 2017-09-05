//
//  ColorButtonStyle.swift
//  Maily
//
//  Created by nueola on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class ColorButtonStyle: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        self.layer.cornerRadius = CGFloat(self.frame.height / 2)
        self.layer.borderColor = UIColor.white.cgColor
        self.alpha = 0.5
        self.isSelected = false
    }
    
    func toggle() {
        self.isSelected = !self.isSelected
        self.alpha = self.isSelected ? 1 : 0.5
        self.layer.borderWidth = self.isSelected ? 3 : 0
    }
}
