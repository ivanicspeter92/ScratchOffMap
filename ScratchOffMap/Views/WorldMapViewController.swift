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
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    // MARK: - Event handlers
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCoordinatesFromDatabaseToMapView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(WorldMapViewController.coordinatesReceivedNotificationWasReceived(_:)), name: NSNotification.Name(rawValue: ScratchOffMapNotifications.coordinatesReceived.rawValue), object: nil)
    }
    
    func coordinatesReceivedNotificationWasReceived(_ notification: Notification) {
        if let coordinates = notification.object as? Coordinates {
            self.addCoordinatesToMapViewIfSettingsAllow(coordinates: coordinates)
        }
    }
    
    // MARK: - Private functions
    private func loadCoordinatesFromDatabaseToMapView() {
        let coordinates = DatabaseManager.selectCoordinates()
        print("Loading " + coordinates.count.description + " points to the map")
        coordinates.forEach {
            self.addCoordinatesToMapViewIfSettingsAllow(coordinates: $0)
        }
    }
    
    private func addCoordinatesToMapViewIfSettingsAllow(coordinates: Coordinates) {
        if LifecycleController.displayCoordinatesWithoutCountry || !LifecycleController.displayCoordinatesWithoutCountry && coordinates.country != nil {
            self.mapView.addAnnotation(coordinates)
        }
    }
}
