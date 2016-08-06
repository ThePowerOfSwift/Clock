//
//  UserDefaults.swift
//  Clock
//
//  Created by Developer on 8/5/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit


let datepikerKey = "PKkey"

class UserDefaults: NSObject {
    
    // MARK: - Properties
    
    static let sharedInstance = UserDefaults()
    
    private override init() { }
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    // MARK: - Helper Methods
    
    func getIntDateFromNSUserDefaults(fromKey key: String) -> Int { return userDefaults.objectForKey(key) as? Int ?? 0 }
    
    func getDoubletDateFromNSUserDefaults(fromKey key: String) -> Double { return userDefaults.objectForKey(key) as? Double ?? 0.0 }
    
    func getStringDateFromNSUserDefaults(fromKey key: String) -> String {
        return userDefaults.objectForKey(key) as? String ?? Constants.StopWatch.StartAllZerosText
    }
    
    func getStringArrayDateFromNSUserDefaults(fromKey key: String) -> [String] {
        return userDefaults.objectForKey(key) as? [String] ?? []
    }
    
    func saveNSUserDefaultsData(value: AnyObject?, withKey key: String) {
        self.userDefaults.setObject(value, forKey: key)
        self.userDefaults.synchronize()
    }
    
    func saveArrayToNSUserDefaultsData(value: [AnyObject]?, withKey key: String) {
        self.userDefaults.setObject(value, forKey: key)
        self.userDefaults.synchronize()
    }
    
    func saveDatePickerToNSUserDefaults(value: UIDatePicker, withKey key: String) {
        self.userDefaults.setObject(value.date, forKey: key)
        self.userDefaults.synchronize()
    }
    
    func getDatePickerFromNSUserDefaults(from key: String) -> NSDate {
        return userDefaults.objectForKey(datepikerKey) as! NSDate
    }
    
    
    func saveCountdownTimeToNSUserDefaults(value: String, withKey key: String) {
        self.userDefaults.setObject(value, forKey: key)
        self.userDefaults.synchronize()
    }
    
    func getCountDownTimeFromNSUserDefaults(fromKey key: String) -> String {
        return userDefaults.objectForKey(key) as? String ?? Constants.StopWatch.StartAllZerosText
    }
    
    
    
}