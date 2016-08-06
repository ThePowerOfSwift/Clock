//
//  WorldClocks.swift
//  Clock
//
//  Created by Mihail Șalari on 8/4/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

class WorldClocks: NSObject {
    
    static let sharedInstance = WorldClocks()

    private override init() { }
    
    var allWorldClocks: [String] {
        get {
            return UserDefaults.sharedInstance.getStringArrayDateFromNSUserDefaults(fromKey: Constants.WorldClockPerferences.WorldClockArray)
        }
        set(worldClocksList) {
            UserDefaults.sharedInstance.saveArrayToNSUserDefaultsData(worldClocksList, withKey: Constants.WorldClockPerferences.WorldClockArray)
        }
    }
    
    func populateNSUserDefaults() {
        let localTimeZone = CityTime.sharedInstance.getStringTimeZoneFullName()
        let worldClockWithLocalTimeZone = [localTimeZone]
        UserDefaults.sharedInstance.saveArrayToNSUserDefaultsData(worldClockWithLocalTimeZone, withKey: Constants.WorldClockPerferences.WorldClockArray)
    }
    
    func saveAllTimeZones() {
        UserDefaults.sharedInstance.saveArrayToNSUserDefaultsData(allWorldClocks, withKey: Constants.WorldClockPerferences.WorldClockArray)
    }

}