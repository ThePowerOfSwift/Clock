//
//  Timer.swift
//  Clock
//
//  Created by Mihail Șalari on 8/4/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

class StopWatch: NSObject {
    
    // MARK: - Properties
    
    static let sharedInstance = StopWatch()
    
    private override init() { }
    
    var minutes: Int {
        get { return UserDefaults.sharedInstance.getIntDateFromNSUserDefaults(fromKey: Constants.StopWatch.MinuteLKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.MinuteLKey) }
    }
    
    var seconds: Int {
        get { return UserDefaults.sharedInstance.getIntDateFromNSUserDefaults(fromKey: Constants.StopWatch.SecondsKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.SecondsKey) }
    }
    
    var fractions: Int {
        get { return UserDefaults.sharedInstance.getIntDateFromNSUserDefaults(fromKey: Constants.StopWatch.FractionsKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.FractionsKey) }
    }
    
    var minutesLap: Int {
        get { return UserDefaults.sharedInstance.getIntDateFromNSUserDefaults(fromKey: Constants.StopWatch.MinutesLapKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.MinutesLapKey) }
    }
    
    var secondsLap: Int {
        get { return UserDefaults.sharedInstance.getIntDateFromNSUserDefaults(fromKey: Constants.StopWatch.SecondsLapKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.SecondsLapKey) }
    }
    
    var fractionsLap: Int {
        get { return UserDefaults.sharedInstance.getIntDateFromNSUserDefaults(fromKey: Constants.StopWatch.FractionsLapKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.FractionsLapKey) }
    }
    
    var stopWatchString: String {
        get { return UserDefaults.sharedInstance.getStringDateFromNSUserDefaults(fromKey: Constants.StopWatch.StopWatchStringKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.StopWatchStringKey) }
    }
    
    var stopWatchLapString: String {
        get { return UserDefaults.sharedInstance.getStringDateFromNSUserDefaults(fromKey: Constants.StopWatch.StopWatchLapStringKey) }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.StopWatchLapStringKey) }
    }
    
    var laps: [String] {
        get {
            if let storedLaps = UserDefaults.sharedInstance.userDefaults.objectForKey(Constants.StopWatch.StopWatchLapsKey) as? [String] {
                return storedLaps
            } else { return [] }
        }
        set { UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.StopWatch.StopWatchLapsKey) }
    }
    
    
    // MARK: - Methods
    
    func getLaps(indexPath: NSIndexPath) -> String { return "Laps \(laps.count - indexPath.row)" }
    
    // Calculate general time
    
    func getTime() {
        fractions += 1
        if fractions == 100 {
            
            seconds += 1
            fractions = 0
        }
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondString = seconds > 9 ? "\(seconds)": "0\(seconds)"
        let minuteString = minutes > 9 ? "\(minutes)": "0\(minutes)"
        self.stopWatchString = "\(minuteString):\(secondString):\(fractionString)"
    }
   
   
    // Calculate laps time
    
    func getTimeLap() {
        fractionsLap += 1
        if fractionsLap == 100 {
            
            secondsLap += 1
            fractionsLap = 0
        }
        if secondsLap == 60 {
            minutesLap += 1
            secondsLap = 0
        }
        let fractionString = fractionsLap > 9 ? "\(fractionsLap)" : "0\(fractionsLap)"
        let secondString = secondsLap > 9 ? "\(secondsLap)": "0\(secondsLap)"
        let minuteString = minutesLap > 9 ? "\(minutesLap)": "0\(minutesLap)"
        
        self.stopWatchLapString = "\(minuteString):\(secondString):\(fractionString)"
    }
    
    
    func resetTime() {
        fractions = 0
        seconds = 0
        minutes = 0
    }
    
    func resetTimeLap() {
        minutesLap = 0
        secondsLap = 0
        fractionsLap = 0
    }
}