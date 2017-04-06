//
//  BackgroundStyle.swift
//  Maily
//
//  Created by Danb on 2017. 4. 6..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class BackgroundStyle : UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = CGFloat(self.frame.height/2)
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 6
    }
}
