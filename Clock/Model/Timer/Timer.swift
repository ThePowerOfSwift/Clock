//
//  Timer.swift
//  Clock
//
//  Created by Developer on 8/5/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

class Timer: NSObject {
    
    private let counterKey = "CounterKey"
    
    // MARK: - Properties
    
    static let sharedInstance = Timer()
    
    private override init() { }
    
    var counter: Double {
        get {
            return UserDefaults.sharedInstance.getDoubletDateFromNSUserDefaults(fromKey: counterKey)
        }
        set {
            UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: counterKey)
        }
    }
}