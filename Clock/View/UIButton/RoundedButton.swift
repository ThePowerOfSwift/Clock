//
//  RoundedButton.swift
//  Clock
//
//  Created by Developer on 8/5/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = self.bounds.size.width/2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.init(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).CGColor
    }

}
