//
//  ViewController.swift
//  Location App
//
//  Created by MSCIT on 13/03/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

//    var CLM : CLLocationManager?
//    
//    var GEO:CLGeocoder?
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let MyLocation = locations.first;
//        
//        print("latitude : \(MyLocation!.coordinate.latitude)")
//        print("longitude : \(MyLocation!.coordinate.longitude)")
//        
//        GEO?.geocodeAddressString("London", completionHandler: {_,_ in
//            
//            let Myloction1 = locations.last;
//            print("My Location latitude : \(Myloction1!.coordinate.latitude)")
//            print("My Location longitude : \(Myloction1!.coordinate.longitude)")
//            
//        })
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // To print current latitude & longitude
//        self.CLM = CLLocationManager()
//
//        self.CLM?.delegate = self
//        
//        self.CLM?.desiredAccuracy = kCLLocationAccuracyBest
//        
//        self.CLM?.requestWhenInUseAuthorization()
//        
//        self.CLM?.startUpdatingLocation()
//        
//        self.GEO = CLGeocoder();
//    }
    
    var clm:CLLocationManager?

    var geo:CLGeocoder?

    var places:CLPlacemark?

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.geo=CLGeocoder()

        self.clm=CLLocationManager()

        self.clm?.delegate=self

        self.clm?.desiredAccuracy=kCLLocationAccuracyBest

        self.clm?.requestWhenInUseAuthorization()

        self.clm?.startUpdatingLocation()

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let myloc=locations.first

        //print(myloc?.coordinate.latitude)

//print(myloc?.coordinate.longitude)

       /*

        geo?.geocodeAddressString("Surat, India", completionHandler: {_,_ in

            do {

                print(locations.last?.coordinate.latitude)

                print(locations.last?.coordinate.longitude)

            }

            // 0

        })
        21°09'02.5"N 72°45'27.4"E
*/

        geo?.reverseGeocodeLocation(CLLocation(latitude: 21.150650, longitude: 72.757611)) { (placemarks, error) in

            if error != nil {

                print("something went horribly wrong")

            }

            if let placemarks = placemarks {

                self.places = placemarks.first

                print(self.places!.country! as Any)

                print(self.places!.administrativeArea! as Any)

                print(self.places!.postalCode! as Any)
                
                print(self.places!.subLocality! as Any)
                
                print(self.places!.locality! as Any)



            }

        }
    }
}

