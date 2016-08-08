//
//  TimerViewController.swift
//  Clock
//
//  Created by Mihail Șalari on 7/30/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var countdown: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker! {
        didSet {
            timePicker.countDownDuration = Timer.sharedInstance.counter
        }
    }
    @IBOutlet weak var startButton: RoundedButton!
    @IBOutlet weak var pauseButton: RoundedButton!
    
    var timer = NSTimer()
    var timerOn = false // Timer initiated with value
    var timerPaused = false // Timer running
    
    
    // MARK: - Lyfe Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.disablePauseButton()
        self.setStartButton()
        self.hidePickerOnStart()
        self.verifCountDownTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        countdown.text = Timer.sharedInstance.countdownText
        //timePicker.countDownDuration = Timer.sharedInstance.counter
    }
    
    
    // MARK: - UI
    
    func hidePickerOnStart() {
        timePicker.hidden = false
        countdown.hidden = true
        
        // set bg picker
        self.timePicker.backgroundColor = UIColor.whiteColor()
    }
    
    func verifCountDownTime() {
        
        print(Timer.sharedInstance.counter)
        
        if countdown.text == Constants.StopWatch.StartAllZerosText {
            self.countdown.hidden = true
        }
        
        if Timer.sharedInstance.counter > 0.0 || countdown.text != Constants.StopWatch.StartAllZerosText {
            self.timePicker.hidden = true
            self.countdown.hidden = false
            self.startButton.setTitle("Resume", forState: .Normal)
        } else {
            self.timePicker.hidden = false
            self.countdown.hidden = true
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        
        Timer.sharedInstance.stopSound()
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
        let (hours, minutes, seconds) = Timer.sharedInstance.getTime()
        
        if Timer.sharedInstance.counter >= 0.0 {
            Timer.sharedInstance.counter = Timer.sharedInstance.counter - 0.01
            
            if hours <= 0 {
                countdown.text = String(format: "%02d:%02d", minutes, seconds)
                Timer.sharedInstance.countdownText = String(format: "%02d:%02d", minutes, seconds)
            } else {
                countdown.text = String(format: "%d:%02d:%02d", hours, minutes, seconds)
                Timer.sharedInstance.countdownText = String(format: "%d:%02d:%02d", hours, minutes, seconds)
            }
        } else {
            stopTimer()
            Timer.sharedInstance.playSound()
            
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
    
   
}
