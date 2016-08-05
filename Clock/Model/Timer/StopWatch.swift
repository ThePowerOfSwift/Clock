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
        
        self.fractions += 1
        if  self.fractions == 100 {
            
            self.seconds += 1
             self.fractions = 0
        }
        if self.seconds == 60 {
            self.minutes += 1
            self.seconds = 0
        }
        
        let fractionString =  self.fractions > 9 ? "\( self.fractions)" : "0\( self.fractions)"
        let secondString = self.seconds > 9 ? "\(self.seconds)": "0\(self.seconds)"
        let minuteString = self.minutes > 9 ? "\(self.minutes)": "0\(self.minutes)"
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