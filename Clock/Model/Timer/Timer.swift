//
//  Timer.swift
//  Clock
//
//  Created by Developer on 8/5/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import AVFoundation

class Timer: NSObject {
    
    // MARK: - Properties
    
    static let sharedInstance = Timer()
    
    private override init() { }
    
    var counter: Double {
        get {
            return UserDefaults.sharedInstance.getDoubletDateFromNSUserDefaults(fromKey: Constants.TimerViewController.CounterKey)
        }
        set {
            UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.TimerViewController.CounterKey)
        }
    }
    
    var countdownText: String {
        get {
            return UserDefaults.sharedInstance.getStringDateFromNSUserDefaults(fromKey: Constants.TimerViewController.CountDownKey)
        }
        set {
            UserDefaults.sharedInstance.saveNSUserDefaultsData(newValue, withKey: Constants.TimerViewController.CountDownKey)
        }
    }
    
    private var audioPlayer: AVAudioPlayer!
    private var alarmSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("loud_alarm", ofType: "caf")!)
    
    
    // MARK: - Get Time From Date Picker
    
    func getTime() -> (Int, Int, Int) {
        let minutesInAnHour = 60.0
        let secondsInAMinute = 60.0
        
        let seconds = Int(counter % secondsInAMinute)
        let totalMinutes = Int(counter / secondsInAMinute)
        let minutes = Int(Double(totalMinutes) % minutesInAnHour)
        let hours = Int(Double(totalMinutes) / minutesInAnHour)
        
        return (hours, minutes, seconds)
    }
    
    
    // MARK: - Play/Stop Alarm's Sound
    
    func playSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: alarmSound)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch let error as NSError {
            print("Play Sound Error \(error.description)")
        }
    }
    
    func stopSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: alarmSound)
            audioPlayer.stop()
        } catch let error as NSError {
           print("Stop Sound Error \(error.description)")
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}