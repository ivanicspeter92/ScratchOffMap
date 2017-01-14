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
    @IBOutlet weak var addButton: UIBarButtonItem!
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
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        self.displayAddOptions()
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
    
    private func displayAddOptions() {
        let alert = UIAlertController(title: "Add...", message: nil, preferredStyle: .actionSheet)
        alert.popoverPresentationController?.barButtonItem = self.addButton
        
        alert.addAction(UIAlertAction(title: "My current position", style: .default, handler: { (UIAlertAction) in
            LifecycleController.coordinateCollector.performTask()
        }))
        alert.addAction(UIAlertAction(title: "Coordinates manually", style: .default, handler: { (UIAlertAction) in
            self.displayCoordinateInserterAlert()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func displayCoordinateInserterAlert() {
        let alert = UIAlertController(title: "Insert coordinates manually", message: nil, preferredStyle: .alert)
        
        alert.addTextField(text: nil, placeholder: "lat,lon", editingChangedTarget: nil, editingChangedSelector: nil)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
            if let coordinateString = alert.textFields?[0].text, let coordinates = Coordinates(string: coordinateString) {
                DatabaseManager.insert(coordinates: coordinates)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
