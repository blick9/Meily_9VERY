//
//  GoalCollectionViewCell.swift
//  Maily
//
//  Created by Danb on 2017. 3. 31..
//  Copyright © 2017년 Febrix. All rights reserved.
//

import UIKit

class GoalCollectionViewCell: UICollectionViewCell {
    var shadowColor = UIColor.init(red: 255/0, green: 255/0, blue: 255/0, alpha: 0.3).cgColor
    
    @IBOutlet weak var goalCardTitle: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = shadowColor

    }
}
