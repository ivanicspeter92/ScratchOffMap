//
//  SettingsTableViewController.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 09/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var counriesOutsideCountriesSwitch: UISwitch!
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.displayDutyCyclingPicker()
        } else if indexPath.section == 0 && indexPath.row == 2 {
            self.displayDeletePointsConfirmation()
        }
    }
    
    // MARK: - Event handlers
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender == self.counriesOutsideCountriesSwitch {
            LifecycleController.coordinateCollector?.collectPointsWithoutCountry = sender.isOn
        }
    }
    
    // MARK: - Private functions
    
    private func displayDutyCyclingPicker() {
        let alert = UIAlertController(title: "Duty Cycling", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "5 minutes", style: .default, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "15 minutes", style: .default, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "30 minutes", style: .default, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "1 hour", style: .default, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "Custom", style: .default, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func displayDeletePointsConfirmation() {
        let alert = UIAlertController(title: "Delete Points", message: "Are you sure you want to delete all colelcted points?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (UIAlertAction) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
