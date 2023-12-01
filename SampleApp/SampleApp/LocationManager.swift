//
//  LocationManager.swift
//  SampleApp
//
//  Created by dlovewanshi on 30/11/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate{
    
    //Singleton instance
    static let shared = LocationManager()
    private var locationManager : CLLocationManager

    //Callback clouser for location updates
    var locationUpdateHandler: ((CLLocation) -> Void)?
    
    private override init() {
        locationManager = CLLocationManager()
       super.init()
    }
    
     func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // Request location permissions
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    //Request location updates
    func startUpdatingLocation(){
        locationManager.startUpdatingLocation()
    }
    
    //Stop location updates
    func stopUpdatingLocation(){
        locationManager.stopUpdatingLocation()
    }

    //CLLocationManagerDelegate method called on location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newlocation = locations.last else {return}
        locationUpdateHandler?(newlocation)
    }
    
    //Handle location manager error's
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint("Location Error: \(error.localizedDescription)")
    }
}
