//
//  Constants.swift
//  Clock
//
//  Created by Developer on 7/27/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Alphabet {
        static let sections = ["A", "B", "C", "D", "E",
                               "F", "G", "H", "I", "J",
                               "K", "L", "M", "N", "O",
                               "P", "Q", "R", "S", "T",
                               "U", "V", "W", "X", "Y", "Z"]
    }
    
    struct AllCitiesPreferences {
        static let AllCitiesZonePref = "AllTimeZones"
    }
    
    struct WorldClockPerferences {
        static let WorldClockArray = "WorldClocks"
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
    
    struct TimerViewController {
        static let CountDownKey = "TimerKey"
        static let CounterKey = "CounterKey"
    }
}

