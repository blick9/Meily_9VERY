//
//  GreenButton.swift
//  Maily
//
//  Created by nueola on 2017. 4. 3..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class GreenButton: UIButton {
     @IBInspectable var buttonColor: UIColor = UIColor.init ( red: 164.0/255.0, green: 255.0/255.0, blue: 164.0/255.0, alpha: 1 )
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)//view 위치의 가운데
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 1//굵기
        let startAngle: CGFloat = 3 * π / 2
        let endAngle: CGFloat = 7 * π / 2
        var path = UIBezierPath(arcCenter: center,
                                radius: radius/2.4 - arcWidth/2.4,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        
        buttonColor.setFill()
        path.lineWidth = arcWidth
        path.fill()
        buttonColor.setStroke()
        path.stroke()
    }

}
