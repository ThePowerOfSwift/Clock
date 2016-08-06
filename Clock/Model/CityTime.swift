//
//  CityTime.swift
//  Clock
//
//  Created by Mihail Șalari on 7/30/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

enum Present: String {
    case Today
}

class CityTime {
    
    static let sharedInstance = CityTime()
    
    var currentDate: NSDate
    var dateFormatter: NSDateFormatter
    
    init() {
        currentDate = NSDate()
        dateFormatter = NSDateFormatter()
    }
    
    func getStringTimeZoneFullName() -> String {
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        let timeZone = "\(dateFormatter.timeZone)".componentsSeparatedByString(" (")
        
        return "\(timeZone[0])"
    }
    
    func getStringTimeZoneFirstName() -> String {
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        let timeZone = "\(dateFormatter.timeZone)".componentsSeparatedByString(" (")
        return "\(timeZone[0])"
    }
    
    func getStringFromDate(timeZoneName: String) -> String {
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.AMSymbol = "AM"
        dateFormatter.PMSymbol = "PM"
        dateFormatter.timeZone = NSTimeZone(name: timeZoneName)
        return dateFormatter.stringFromDate(currentDate)
    }
    
    func getLocaleTimeZone() -> String {
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.AMSymbol = "AM"
        dateFormatter.PMSymbol = "PM"
        return dateFormatter.stringFromDate(currentDate)
    }
    
    private func getIntFromTimeZoneAMPM(timeZoneName: String) -> (hour: Int, minutes: Int)? {
        dateFormatter.dateFormat = "h:mm"
        dateFormatter.timeZone = NSTimeZone(name: timeZoneName)
        let stringDate = dateFormatter.stringFromDate(currentDate)
        let stringArrayOfDoubles = stringDate.componentsSeparatedByString(":")
        
        if let hour = Int(stringArrayOfDoubles[0]), let minutes = Int(stringArrayOfDoubles[1]) {
            return (hour: hour, minutes: minutes)
        } else {
            return nil
        }
    }
    
    func getDifferenceFromTwoTimeZones(timeZone: String) -> String {
        var returnedValue = String()
        
        if let unknownTimeZone = getIntFromTimeZoneAMPM(timeZone),
            let localTimeZone = getIntFromTimeZoneAMPM(getLocaleTimeZone()) {
            
            if localTimeZone == unknownTimeZone {
                returnedValue = Present.Today.rawValue
            } else if localTimeZone > unknownTimeZone {
                returnedValue = "\(Present.Today.rawValue), \(localTimeZone.hour - unknownTimeZone.hour) hours behind."
                
            } else {
                returnedValue = "\(Present.Today.rawValue), \(unknownTimeZone.hour - localTimeZone.hour)h \(unknownTimeZone.minutes)m ahead."
            }
        }
        return returnedValue
    }
    
    func getWorldClockCityName(worldClock: String) -> String {
        
        let cityName = worldClock.componentsSeparatedByString("/")
        
        if cityName.count > 1 {
            return "\(cityName[1])"
        } else {
            return worldClock
        }
    }
}