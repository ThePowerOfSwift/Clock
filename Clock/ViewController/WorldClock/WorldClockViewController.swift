//
//  WorldClockViewController.swift
//  Clock
//
//  Created by Mihail Șalari on 7/26/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class WorldClockViewController: UITableViewController, CitiesTransferableDelegate {
    
    // MARK: - Properties
    
    struct StoryBoard {
        static let WorldCellIdentifier = "WorldClockCell"
        static let AddNewClockViewControllerSegue = "AddNewCity"
    }
    
    
    // MARK: - Lyfe Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNavigationBarButtons()
        
    }
  
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        TimeZones.sharedInstance.saveAllTimeZones()
        WorldClocks.sharedInstance.saveAllTimeZones()
        self.tableView.reloadData()

    }
    
    
    // MARK: - CitiesTransferableDelegate
    
    func updateCity(city: String) {
        WorldClocks.sharedInstance.allWorldClocks.append(city)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        self.tableView.reloadData()
    }
    
    // MARK: - UI
    
    override func editButtonItem() -> UIBarButtonItem {
        let editButton = super.editButtonItem()
        editButton.tintColor = UIColor.redColor()
        return editButton
    }
    
    func addNavigationBarButtons() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
        addButton.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItem = addButton
    }
   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WorldClocks.sharedInstance.allWorldClocks.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StoryBoard.WorldCellIdentifier, forIndexPath: indexPath) as! WorldClockTableViewCell
        let worldClockObject = WorldClocks.sharedInstance.allWorldClocks[indexPath.row]
        
        cell.cityLabel.text = CityTime.sharedInstance.getWorldClockCityName(worldClockObject)
        cell.digitalClockView.text = CityTime.sharedInstance.getStringFromDate(worldClockObject)
        cell.titleLabel.text = CityTime.sharedInstance.getDifferenceFromTwoTimeZones(worldClockObject)

        return cell
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            WorldClocks.sharedInstance.allWorldClocks.removeAtIndex(indexPath.row)
            //if WorldClocks.sharedInstance.allWorldClocks.count > 1 {
                //let currentWorldClock = WorldClocks.sharedInstance.allWorldClocks[indexPath.row]
                //print(currentWorldClock)
                print(WorldClocks.sharedInstance.allWorldClocks.count)
                //TimeZones.sharedInstance.allTimeZones.append(currentWorldClock)
            //}
            
            
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    

    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == StoryBoard.AddNewClockViewControllerSegue{
            guard let addClockVC = segue.destinationViewController.contentViewController as? AddClockViewController else { return }
            addClockVC.delegate = self
        }
    }
 
    
    
    
    // MARK: - IBActions
    
    func insertNewObject(sender: AnyObject) {
        self.performSegueWithIdentifier(StoryBoard.AddNewClockViewControllerSegue, sender: self)
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
}
