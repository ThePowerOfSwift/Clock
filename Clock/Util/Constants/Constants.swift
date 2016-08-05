//
//  Constants.swift
//  Clock
//
//  Created by Developer on 7/27/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

struct Constants {
    
    struct AllCitiesPreferences {
        static let AllCitiesZonePref = "AllTimeZones"
    }
    
    struct WorldClockPerferences {
        static let WorldClockArray = "WorldClocks"
    }
    
    static let DomainError = "com.mihailsalari.CoreDataError"
    
    static let Code = 9999
    
    struct CoreDataStack {
        static let URLByAppendingPathComponent = "Clock.sqlite"
        static let URLForResource = "Clock"
        static let WithExtension = "momd"
        static let NSLocalizedDescriptionKeyError = "Failed to initializa the application's saved data"
        static let NSLocalizedFailureReasonErrorKeyError = "There was an eror creating of loading the application's saved data"
    }
    
    struct DataSource {
        static let CellIdentifier = "CityListCell"
    }
    
    struct StopWatch {
        static let StartAllZerosText = "00:00:00"
        static let CellIdentifier = "StopWatchCell"
        
        static let StopWatchStringKey = "stopWatchString"
        static let StopWatchLapStringKey = "stopWatchLapKey"
        static let StopWatchLapsKey = "lapsKey"
        
        static let MinuteLKey = "minKey"
        static let SecondsKey = "secKey"
        static let FractionsKey = "fracKey"
        
        static let MinutesLapKey = "minutesLapKey"
        static let SecondsLapKey = "secondsLapKey"
        static let FractionsLapKey = "fractionsLapKey"
    }
    
    struct TimmerViewController {
        static let TimerCell = "TimerCell"
    }
    
    struct AddSoundViewController {
        static let SoundCell = "SoundCell"
    }

}

struct Alphabet {
    static let sections = ["A", "B", "C", "D", "E",
                           "F", "G", "H", "I", "J",
                           "K", "L", "M", "N", "O",
                           "P", "Q", "R", "S", "T",
                           "U", "V", "W", "X", "Y", "Z"]
}