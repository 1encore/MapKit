//
//  Place.swift
//  Maps
//
//  Created by Beisenbek Yerbolat on 12/2/17.
//  Copyright © 2017 Beisenbek Yerbolat. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject, MKAnnotation {
    
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
}
