//
//  ViewController.swift
//  Maps
//
//  Created by Beisenbek Yerbolat on 12/2/17.
//  Copyright © 2017 Beisenbek Yerbolat. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let initialLocation = CLLocation(latitude: 43.222, longitude: 76.8512)
//        self.centerMapOnLocation(location: initialLocation)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.requestLocation()
        }
        
        mapView.showsUserLocation = true
        self.getData()
    }
    
    func getData() {
        let place1 = Place(title: "Zhanbyl Zhabayev", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.228614, 76.960800))
        let place2 = Place(title: "Beatles", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.129998, 76.905035))
        let place3 = Place(title: "Manshuk Mametova", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.251249, 76.894864))
        let place4 = Place(title: "Abay", subtitle: "Monument", coordinate: CLLocationCoordinate2DMake(43.238931, 76.897097))
        
        mapView.addAnnotation(place1)
        mapView.addAnnotation(place2)
        mapView.addAnnotation(place3)
        mapView.addAnnotation(place4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let regionRadius :CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.centerMapOnLocation(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

