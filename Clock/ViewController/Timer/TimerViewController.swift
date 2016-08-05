//
//  TimerViewController.swift
//  Clock
//
//  Created by Mihail Șalari on 7/30/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController  {
    
    @IBOutlet weak var countdown: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var startButton: RoundedButton!
    @IBOutlet weak var pauseButton: RoundedButton!
    
    var timer = NSTimer()
    
    var timerOn = false // Timer initiated with value
    var timerPaused = false // Timer running
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.hidden = false
        countdown.hidden = true
        disablePauseButton()
        
        setStartButton()
        self.timePicker.backgroundColor = UIColor.whiteColor()
        
        print(Timer.sharedInstance.counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        
        timerPaused = false
        
        if timerOn {
            stopTimer()
        } else {
            setStopButton()
            startTimer()
        }
    }
    
    @IBAction func pauseButtonPressed(sender: AnyObject) {
        
        if timerOn {
            if !timerPaused {
                
                // Pause timer label
                timer.invalidate()
                timerPaused = true
                pauseButton.setTitle("Resume", forState: .Normal)

            } else if timerPaused {
                // Resume timer countdown
                timerPaused = false
                timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
                pauseButton.setTitle("Pause", forState: .Normal)
            }
        }
    }
    
    func updateTimer() {
        
        print(Timer.sharedInstance.counter)
        
        let (hours, minutes, seconds) = getTime(timePicker)
        
        if Timer.sharedInstance.counter >= 0.0 {
            Timer.sharedInstance.counter = Timer.sharedInstance.counter - 0.01
            if hours <= 0 {
                countdown.text = String(format: "%02d:%02d", minutes, seconds)
            } else {
                countdown.text = String(format: "%d:%02d:%02d", hours, minutes, seconds)
            }
        } else {
            stopTimer()
            
        }
    }
    
    func setStartButton() {
        startButton.setTitle("Start", forState: .Normal)
        startButton.setTitleColor(UIColor.init(red: 0, green: 224/255, blue: 39/255, alpha: 1.0), forState: .Normal)
    }
    
    func setStopButton() {
        startButton.setTitle("Stop", forState: .Normal)
        startButton.setTitleColor(UIColor.redColor(), forState: .Normal)
    }
    
    func enablePauseButton() {
        pauseButton.enabled = true
        pauseButton.alpha = 1.0
    }
    
    func disablePauseButton() {
        pauseButton.enabled = false
        pauseButton.alpha = 0.5
    }
    
    func startTimer() {
        // Hide timePicker and show countdown
        countdown.hidden = false
        timePicker.hidden = true
        enablePauseButton()
        
        // Set countdown.text to timePicker value and start timer
        Timer.sharedInstance.counter = timePicker.countDownDuration
        updateTimer()
        timerOn = true
        timerPaused = false
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {

        pauseButton.setTitle("Pause", forState: .Normal)
        disablePauseButton()
        timer.invalidate()
        countdown.hidden = true
        timePicker.hidden = false
        
        setStartButton()
        
        timerOn = false
        timerPaused = false
        timer.invalidate()
    }
    
    func getTime(datePicker: UIDatePicker) -> (Int, Int, Int) {
        let minutesInAnHour = 60.0
        let secondsInAMinute = 60.0
        
        let seconds = Int(Timer.sharedInstance.counter % secondsInAMinute)
        let totalMinutes = Int(Timer.sharedInstance.counter / secondsInAMinute)
        let minutes = Int(Double(totalMinutes) % minutesInAnHour)
        let hours = Int(Double(totalMinutes) / minutesInAnHour)
        
        return (hours, minutes, seconds)
    }
}
