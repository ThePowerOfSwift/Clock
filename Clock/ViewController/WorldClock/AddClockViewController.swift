//
//  AddClockViewController.swift
//  Clock
//
//  Created by Mihail Șalari on 7/26/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

protocol CitiesTransferableDelegate {
    func updateCity(city: String)
}

class AddClockViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    struct StoryBoard {
        static let CityListCellIdentifier = "CityListCell"
        static let AddNewClockViewControllerSegue = "AddNewCity"
    }
    
    var delegate: CitiesTransferableDelegate!
    let searchBar = UISearchBar()
    var inSearchMode = false
    var filteredTimeZones = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.sectionIndexColor = UIColor.redColor()
        
        self.createSearchBar()
        self.createCancelButtonNavigationBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        TimeZones.sharedInstance.allTimeZones.sortInPlace(<)
        TimeZones.sharedInstance.saveAllTimeZones()
        self.tableView.reloadData()
    }
    
    func dismissCurrentController(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func createSearchBar() {
        
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        searchBar.tintColor = UIColor.redColor()
        self.navigationItem.titleView = searchBar
    }
    
    func createCancelButtonNavigationBar() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(dismissCurrentController(_:)))
        cancelButton.tintColor = UIColor.redColor()
        self.navigationItem.rightBarButtonItem = cancelButton

    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  inSearchMode ? filteredTimeZones.count : TimeZones.sharedInstance.allTimeZones.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(StoryBoard.CityListCellIdentifier, forIndexPath: indexPath)
        
        var timeZone: String!
        if inSearchMode {
            timeZone = filteredTimeZones[indexPath.row]
        } else {
            timeZone = TimeZones.sharedInstance.allTimeZones[indexPath.row]
        }
        
        cell.textLabel?.text = timeZone  //TimeZones.sharedInstance.allTimeZones[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let timeZoneClock: String!
        if inSearchMode {
            timeZoneClock = filteredTimeZones[indexPath.row]
        } else {
            timeZoneClock = TimeZones.sharedInstance.allTimeZones[indexPath.row]
        }
        
        print(timeZoneClock) // to verify
        
        self.delegate?.updateCity(TimeZones.sharedInstance.allTimeZones[indexPath.row])
        
        TimeZones.sharedInstance.allTimeZones.removeAtIndex(indexPath.row)
        TimeZones.sharedInstance.saveAllTimeZones()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
        
    
  
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == "" {
            self.inSearchMode = false
            self.view.endEditing(true)
            self.tableView.reloadData()
        } else {
            self.inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            self.filteredTimeZones = TimeZones.sharedInstance.allTimeZones.filter({$0.rangeOfString(lower) != nil})
            self.tableView.reloadData()
        }
    }
}

