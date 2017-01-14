//
//  CountriesTableViewController+CountryListDelegate.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 14/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

extension CountriesTableViewController: CountryListDelegate {
    func showCountriesWithoutCodeChanged() {
        self.loadVisitedCountriesFromDatabase()
    }
}
