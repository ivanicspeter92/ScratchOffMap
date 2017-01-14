//
//  WorldMapViewController.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 09/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import UIKit
import MapKit

class WorldMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCoordinatesFromDatabaseToMapView()
    }
    
    func loadCoordinatesFromDatabaseToMapView() {
        let coordinates = DatabaseManager.selectCoordinates()
        print("Loading " + coordinates.count.description + " points to the map")
        coordinates.forEach {
            if LifecycleController.displayCoordinatesWithoutCountry || !LifecycleController.displayCoordinatesWithoutCountry && $0.country != nil {
                self.mapView.addAnnotation($0)
            }
        }
    }
}
