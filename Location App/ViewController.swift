//
//  ViewController.swift
//  Location App
//
//  Created by MSCIT on 13/03/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var CLM : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.CLM?.delegate = self
        
        self.CLM = CLLocationManager()
        
        self.CLM?.desiredAccuracy = kCLLocationAccuracyBest
        
        self.CLM?.requestWhenInUseAuthorization()
        
        self.CLM?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var MyLocation = locations.first;
        
        print(MyLocation?.coordinate.latitude)
        print(MyLocation?.coordinate.longitude)
    }
}

