//
//  UIKit Extensions.swift
//  Facebook
//
//  Created by Mihail Șalari on 6/13/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit


// MARK: - UIViewController

extension UIViewController {
    
    func customBackBarItemNavigationBar() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
    }
    
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}



// MARK: - UIView

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}


// MARK: - UIImageView

extension UIImageView {
    
    class func createImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.image = UIImage(named: imageName)
        imageView.clipsToBounds = true
        
        return imageView
    }
    
}


// MARK: - UIColor

extension UIColor {
    class func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    
    class func blueFacebookFeatureColor() -> UIColor {
        return UIColor.rgb(51, green: 90, blue: 149, alpha: 1)
    }
    
    class func lightGrayFacebookFeatureColor() -> UIColor {
        return UIColor.rgb(155, green: 161, blue: 171, alpha: 1)
    }

    class func dividerFacebookFeatureColor() -> UIColor {
        return UIColor.rgb(226, green: 228, blue: 232, alpha: 1)
    }
    
    class func requestButtonFeatureColor() -> UIColor {
        return UIColor.rgb(87, green: 143, blue: 225, alpha: 1)
    }
    
    class func tableviewSeparatorFeatureColor() -> UIColor {
        return UIColor.rgb(229, green: 231, blue: 235, alpha: 1)
    }
    
    
    class func generalBackgroundColor() -> UIColor {
        return UIColor.rgb(240, green: 239, blue: 244, alpha: 1)
    }
}



// MARK: - UIFont

extension UIFont {
    
    class func mediumSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    class func lightSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    
    class func thinSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Thin", size: size)!
    }
    
    class func ultraLightSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-UltraLight", size: size)!
    }
    
    
}

// MARK: - UIButton

extension UIButton {
    func setButton(button: UIButton, setTitle: String, titleColor: UIColor, backgroundColor: UIColor) {
        button.setTitle(setTitle, forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(17)
        button.setTitleColor(titleColor, forState: .Normal)
        button.backgroundColor = backgroundColor
    }
    
    class func setSimpleButton(setTitle title: String, titleColor color: UIColor, setFont font: UIFont, cornerRadius radius: CGFloat, backgroundColor bgColor: UIColor) -> UIButton {
        let button = UIButton(type: .System)
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(color, forState: .Normal)
        button.titleLabel?.font = font
        button.layer.cornerRadius = radius
        button.clipsToBounds = true
        button.backgroundColor = bgColor
        button.tintColor = color
        
        return button
    }
    
    
    func setFacebookButton(button: UIButton, firstText: String, secondText: String, titleColor: UIColor, bgColor: UIColor) {
        
        let atributedText = NSMutableAttributedString(string: firstText, attributes: [NSFontAttributeName: UIFont.lightSystemFontOfSize(18), NSForegroundColorAttributeName: titleColor])
        
        atributedText.appendAttributedString(NSAttributedString(string: secondText, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(18), NSForegroundColorAttributeName: titleColor]))
        button.setAttributedTitle(atributedText, forState: .Normal)
        button.backgroundColor = bgColor
    }
    
    class func createButtonWithImage(withTitle title: String, imageName name: String, titleColor color: UIColor, tintColor tColor: UIColor, withFont font: UIFont) -> UIButton {
        let button = UIButton(type: .System)
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(color, forState: .Normal)
        button.setImage(UIImage(named: name), forState: .Normal)
        button.tintColor = tColor
        button.titleLabel?.font = font
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        
        return button
    }
}




// MARK: - UILabel

extension UILabel {
    func createCustomLabel(label: UILabel, title: String, textColorLabel: UIColor) {
        label.text = title
        label.font = UIFont.boldSystemFontOfSize(18)
        label.textColor = textColorLabel
    }
    
    func createCategoryMenuLabel(label: UILabel, title: String, textColorLabel: UIColor) {
        label.text = title.uppercaseString
        label.font = UIFont.boldSystemFontOfSize(18)
        label.textColor = textColorLabel
    }
    
    func createCategoryMenuLabelHome(title: String, textColorLabel: UIColor) {
        self.text = title.uppercaseString
        self.font = UIFont.boldSystemFontOfSize(18)
        self.textColor = textColorLabel
    }
    
    func createCategoryHeaderLabel(label: UILabel, bgColor: UIColor, setTitle: String, setTextColor: UIColor, isCapitalize: Bool) {
        
        self.frame = CGRectMake(0, 0, 100, 50)
        self.backgroundColor = bgColor
        self.text = setTitle
        self.textColor = setTextColor
        if isCapitalize {
            self.text?.capitalizedString
        } else {
            self.text?.lowercaseString
        }
    }
    
    
    class func createLabelWithImage(labelTitle title: String, imageName name: String, iconWidth width: CGFloat, iconHeight height: CGFloat) -> UILabel {
        let label = UILabel()
        let atributedText = NSMutableAttributedString()
        
        let attachement = NSTextAttachment()
        attachement.image = UIImage(named: name)
        attachement.bounds = CGRectMake(0, -2, width, height)
        atributedText.appendAttributedString(NSAttributedString(attachment: attachement))
        atributedText.appendAttributedString(NSAttributedString(string: title, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(18), NSForegroundColorAttributeName: UIColor.blueColor()]))
        label.attributedText = atributedText
        
        return label
        
    }
   
    class func createLabelWithCustomFont(labelName title: String, numebrOfLines number: Int, textColor color: UIColor, labelFont font: UIFont) -> UILabel {
        let label = UILabel()
        label.numberOfLines = number
        label.text = title
        label.textColor = color
        label.font = font
        
        return label
    }
}





extension UITextField {
    
    class func createCustomTextField(placeholderText text: String, textColor color: UIColor, withFont font: UIFont, contentVerticalAlignement alignement: UIControlContentVerticalAlignment) -> UITextField {
        let textField = UITextField()
        textField.placeholder = text
        textField.textColor = color
        textField.font = font
        textField.contentVerticalAlignment = alignement
        textField.returnKeyType = UIReturnKeyType.Default
        textField.clipsToBounds = true
        textField.sizeToFit()
        
        return textField
    }
}

extension NSDate
{
    func hour() -> Int
    {
        //Get Hour
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: self)
        let hour = components.hour
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Minute, fromDate: self)
        let minute = components.minute
        
        //Return Minute
        return minute
    }
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self)
        
        //Return Short Time String
        return timeString
    }
    
    func offsetFrom(date:NSDate) -> String {
        
        let dayHourMinuteSecond: NSCalendarUnit = [.Day, .Hour, .Minute, .Second]
        let difference = NSCalendar.currentCalendar().components(dayHourMinuteSecond, fromDate: date, toDate: self, options: [])
        
        let seconds = "\(difference.second)s"
        let minutes = "\(difference.minute)m" + " " + seconds
        let hours = "\(difference.hour)h" + " " + minutes
        let days = "\(difference.day)d" + " " + hours
        
        if difference.day    > 0 { return days }
        if difference.hour   > 0 { return hours }
        if difference.minute > 0 { return minutes }
        if difference.second > 0 { return seconds }
        return ""
    }
    
    
    
    func numberOfDaysUntilDateTime(toDateTime: NSDate, inTimeZone timeZone: NSTimeZone? = nil) -> Int {
        let calendar = NSCalendar.currentCalendar()
        if let timeZone = timeZone {
            calendar.timeZone = timeZone
        }
        
        var fromDate: NSDate?, toDate: NSDate?
        
        calendar.rangeOfUnit(.Day, startDate: &fromDate, interval: nil, forDate: self)
        calendar.rangeOfUnit(.Day, startDate: &toDate, interval: nil, forDate: toDateTime)
        
        let difference = calendar.components(.Day, fromDate: fromDate!, toDate: toDate!, options: [])
        return difference.day
    }
    
    func differenceInDaysWithDate(date: NSDate) -> Int {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        
        let date1 = calendar.startOfDayForDate(self)
        let date2 = calendar.startOfDayForDate(date)
        
        let components = calendar.components(.Day, fromDate: date1, toDate: date2, options: [])
        return components.day
    }
    
}

@IBDesignable
extension UIButton {
    
    @IBInspectable var cornerRadius :CGFloat {
        
        get {
            return layer.cornerRadius
        }
        
        set {
            
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


extension NSUserDefaults {
    func isFirstLaunch() -> Bool {
        if !NSUserDefaults.standardUserDefaults().boolForKey("HasAtLeastLaunchedOnce") {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "HasAtLeastLaunchedOnce")
            NSUserDefaults.standardUserDefaults().synchronize()
            return true
        }
        return false
    }
}


extension String {
    func replace(target: String, withString: String) -> String {
        return self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
}

