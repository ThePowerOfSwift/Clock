//
//  StopWatcgViewController.swift
//  Clock
//
//  Created by Mihail Șalari on 7/30/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var lapLabel: UILabel!
    @IBOutlet weak var startstopButton: RoundedButton!
    @IBOutlet weak var lapReset: RoundedButton!
    
    var timer = NSTimer()
    var timerLap = NSTimer()

    var startTheStopWatch = true
    var addLap = false
    
    // MARK: - Lyfe Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.stopwatchLabel.text = StopWatch.sharedInstance.stopWatchString
        self.lapLabel.text = StopWatch.sharedInstance.stopWatchLapString
    }
    
    
    // MARK: - NSTimer
    
    func updateTime () {
        StopWatch.sharedInstance.getTime()
        stopwatchLabel.text = StopWatch.sharedInstance.stopWatchString
        
    }
    
    func updateTimeLap() {
        StopWatch.sharedInstance.getTimeLap()
        self.lapLabel.text = StopWatch.sharedInstance.stopWatchLapString
    }
    
    func resetLapTimer() {
        self.timerLap.invalidate()
        StopWatch.sharedInstance.resetTimeLap()
        self.lapLabel.text = Constants.StopWatch.StartAllZerosText
        self.timerLap = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(StopWatchViewController.updateTimeLap), userInfo: nil, repeats: true)
        
    }
    
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StopWatch.sharedInstance.laps.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: Constants.StopWatch.CellIdentifier)
        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel!.text = StopWatch.sharedInstance.getLaps(indexPath)
        cell.detailTextLabel?.text = StopWatch.sharedInstance.laps[indexPath.row]
        
        return cell
    }
    
   
    // MARK: - IBAction's
    
    @IBAction func onStartStopPressed(sender: AnyObject) {
        
        if startTheStopWatch == true {
            
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(StopWatchViewController.updateTime), userInfo: nil, repeats: true)
            self.timerLap = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(StopWatchViewController.updateTimeLap), userInfo: nil, repeats: true)

            self.startstopButton.setTitle("Stop", forState: .Normal)
            self.lapReset.setTitle("Lap", forState: .Normal)
            
            self.startTheStopWatch = false
            self.addLap = true
        } else {
            self.timer.invalidate()
            self.timerLap.invalidate()
            self.startTheStopWatch = true
            self.addLap = false
            self.startstopButton.setTitle("Start", forState: .Normal)
            self.lapReset.setTitle("Reset", forState: .Normal)
        }
        
    }
    
    @IBAction func onLapResetButton(sender: AnyObject) {
        
        if addLap == true {
            StopWatch.sharedInstance.laps.insert(StopWatch.sharedInstance.stopWatchLapString, atIndex: 0)
            self.tableView.reloadData()
            self.resetLapTimer()
        } else {
            self.addLap = false
            StopWatch.sharedInstance.laps.removeAll(keepCapacity: true)
            self.tableView.reloadData()
            self.startstopButton.setTitle("Start", forState: .Normal)
            StopWatch.sharedInstance.resetTime()
            self.stopwatchLabel.text = Constants.StopWatch.StartAllZerosText
            self.self.lapLabel.text = Constants.StopWatch.StartAllZerosText
        }
    }
}
