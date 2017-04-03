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
        self.layer.cornerRadius = CGFloat(self.frame.height / 2)
    }
}


