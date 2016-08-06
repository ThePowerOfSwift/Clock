//
//  Timer.swift
//  Clock
//
//  Created by Developer on 8/5/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation
import AVFoundation

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
    
    private var audioPlayer: AVAudioPlayer!
    private var alarmSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("loud_alarm", ofType: "caf")!)
    
    
    // MARK: - Play/Stop Alarm's Sound
    
    func playSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: alarmSound)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print("Play Sound Error")
        }
    }
    
    func stopSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: alarmSound)
            audioPlayer.stop()
        } catch {
           print("Stop Sound Error")
        }
    }
}