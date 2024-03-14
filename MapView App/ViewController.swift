//
//  ViewController.swift
//  MapView App
//
//  Created by MSCIT on 14/03/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var MAPVIEWOBJ: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // statue of unity
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 21.8380, longitude: 73.7191);
        
        // home
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 21.150650, longitude: 72.757611);
        
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0);
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001);
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span);
        
        self.MAPVIEWOBJ.setRegion(region, animated: true);
        
        // Add anotatioan
        
        let annotation:MKPointAnnotation = MKPointAnnotation();
        annotation.coordinate = location
        
        annotation.title = "Gajjar Harsh";
        annotation.subtitle = "ABC"
        
        MAPVIEWOBJ.addAnnotation(annotation)
    }
}

