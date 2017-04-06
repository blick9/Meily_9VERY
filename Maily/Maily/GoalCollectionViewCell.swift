//
//  GoalCollectionViewCell.swift
//  Maily
//
//  Created by Danb on 2017. 3. 31..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class GoalCollectionViewCell: UICollectionViewCell {
   // var shadowColor = UIColor.init(red: 255/0, green: 255/0, blue: 255/0, alpha: 1).cgColor
    
    @IBOutlet weak var goalInnerView: UIView!
    @IBOutlet weak var goalCardImage: UIImageView!
    @IBOutlet weak var goalCardTitle: UILabel!
    @IBOutlet weak var cellBlur: UIVisualEffectView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOpacity = 0.3
    self.layer.shadowOffset = CGSize(width: 0, height: 3)
    self.layer.shadowRadius = 3
    
    }
    
    override func layoutSubviews() {
        goalInnerView.layer.cornerRadius = 5
    }
}
