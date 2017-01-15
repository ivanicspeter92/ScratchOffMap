//
//  CountriesTableViewController.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 13/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    // MARK: - Variables
    var visitedCountries: [Country] = []
    
    // MARK: - Event handlers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LifecycleController.countyListDelegate = self
        self.loadVisitedCountriesFromDatabase()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return self.visitedCountries.count
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Visited countries"
        case 1: return "Countries to be visited"
        default: return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "CountryCell")!
            
            cell.textLabel?.text = self.visitedCountries[indexPath.row].name
            cell.detailTextLabel?.text = self.visitedCountries[indexPath.row].code
            cell.imageView?.image = self.visitedCountries[indexPath.row].code?.emojiFlag.image()
            
            return cell
        }
        
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    // MARK: - Methods
    func loadVisitedCountriesFromDatabase() {
        self.visitedCountries = LifecycleController.showCountriesWithoutCode ? DatabaseManager.selectCountries() : DatabaseManager.selectCountriesWithCode()
        self.tableView.reloadData()
    }
}
