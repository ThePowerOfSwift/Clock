//
//  WorldClockTableViewCell.swift
//  Clock
//
//  Created by Mihail Șalari on 7/26/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var analogClockView: UIView!
    @IBOutlet weak var digitalClockView: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        if editing {
            self.hideSwitch()
        } else {
            self.showSwitch()
        }
    }
    
    
    
    func showSwitch() {
        self.analogClockView.hidden = true
        
        self.digitalClockView.alpha = 0.0
        
        UIView.animateWithDuration(0.2, animations: {
            self.analogClockView.hidden = false
            self.digitalClockView.alpha = 1.0
            }, completion: nil)
    }
    
    func hideSwitch() {
        self.analogClockView.hidden = false
        self.digitalClockView.alpha = 1.0
        
        UIView.animateWithDuration(0.2, animations: {
            self.analogClockView.hidden = true
            self.digitalClockView.alpha = 0.0
            }, completion: nil)
    }

}
