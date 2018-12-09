//
//  ViewController.swift
//  Where_06
//
//  Created by 戴运鹏 on 2018/12/9.
//  Copyright © 2018 戴运鹏. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func findAction(_ sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
}

extension ViewController:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        addressLabel.text = "Error while updating location" + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if (error != nil){
                self.addressLabel.text = "Reverse geocoder failed with error " + error!.localizedDescription
                return
            }
            
            if (placemarks!.count > 0){
                let pm = placemarks![0]
                self.disPlayLocationInfo(pm)
                
            }else{
                self.addressLabel.text = "Problem with date received from geocoder"
            }
        }
    }
    
    func disPlayLocationInfo(_ placemark:CLPlacemark?) {
        if let containsPlaceMark = placemark {
            locationManager.stopUpdatingLocation()
            let locality = containsPlaceMark.locality != nil ? containsPlaceMark.locality : ""
            let postalCode = containsPlaceMark.postalCode != nil ? containsPlaceMark.postalCode : ""
            let administrativeArea = containsPlaceMark.administrativeArea != nil ? containsPlaceMark.administrativeArea : ""
            let country = containsPlaceMark.country != nil ? containsPlaceMark.country : ""
            self.addressLabel.text = postalCode! + " " + locality!
            self.addressLabel.text?.append("\n" + administrativeArea! + " " + country!)
            
            
            
        }
    }
}





























