//
//  TimeZones.swift
//  Clock
//
//  Created by Mihail Șalari on 8/4/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

class TimeZones: NSObject {
    
    static let sharedInstance = TimeZones()
    
    private override init() { }
    
    var allTimeZones: [String] {
        get {
            return UserDefaults.sharedInstance.getStringArrayDateFromNSUserDefaults(fromKey: Constants.AllCitiesPreferences.AllCitiesZonePref)
        }
        set(timeZoneList) {
            UserDefaults.sharedInstance.saveArrayToNSUserDefaultsData(timeZoneList, withKey: Constants.AllCitiesPreferences.AllCitiesZonePref)
        }
    }
    
    func populateNSUserDefaults() {
        let allTimeZones = NSTimeZone.knownTimeZoneNames()
        
        UserDefaults.sharedInstance.saveArrayToNSUserDefaultsData(allTimeZones, withKey: Constants.AllCitiesPreferences.AllCitiesZonePref)
    }
    
    func addTimeZone(timeZone: String) {
        var allTimeZones = self.allTimeZones
        allTimeZones.append(timeZone)
        self.allTimeZones = allTimeZones
    }
    
    func removeTimeZone(timeZone: String) {
        //var allTimeZones = self.allTimeZones
        
    }
    
    func saveAllTimeZones() {
        UserDefaults.sharedInstance.saveArrayToNSUserDefaultsData(allTimeZones, withKey: Constants.AllCitiesPreferences.AllCitiesZonePref)
    }
}
