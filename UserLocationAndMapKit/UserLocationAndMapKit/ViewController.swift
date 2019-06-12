//
//  ViewController.swift
//  UserLocationAndMapKit
//
//  Created by Ernest DeFoy on 6/11/19.
//  Copyright © 2019 Ernest DeFoy. All rights reserved.
//

//  MARK: Notes
//
//  To simulate a moving location:
//  Simulator -> Debug -> Location -> City Run
//
//  Great Info Resource
//  https://www.thorntech.com/2016/01/how-to-search-for-location-using-apples-mapkit/
//
//  Turn off simulate User location:
//      1. Delete the app from the device.
//      2. Under "Edit Scheme" uncheck the Core Location "Allow Location
//          Simulation" setting.
//      3. Turn the device off and then back on. (Clears
//          out the GPX file, I believe).
//      4. Then re-load the app to the device.
//  Source: https://stackoverflow.com/questions/26124643/turn-off-simulate-user-location-by-xcode
//
//  IMPORTANT!
//  If you are running your App in Simulator, you need to set your location
//   in Xcode or Simulator because Simulator doesn’t have GPS.
//  Source: https://medium.com/@MissionKao/add-a-mapview-in-ios-app-without-storyboard-swift-7f73cbeada36
//  If you try to access your current location in the simulator, you may
//   get -- Error Domain=kCLErrorDomain Code=0 "(null)" -- or
//   -- "Unable to insert COPY_SEND" --
//
//  TODO: Use personal device to get real location. 

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var locationManager = CLLocationManager()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()
    
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.backgroundColor = UIColor.green
        mapView.showsUserLocation = true
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSubviews()
        setupConstraints()
        
        mapView.delegate = self
        
        if CLLocationManager.locationServicesEnabled() == true {
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
                print("request")
            }
            // TODO: Accuracy
            // NOTE: Negative accuracy indicates invalid location.
            locationManager.desiredAccuracy = 1.0
            // MARK: Delegate.
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            // TODO: Alert User
            print("Enable Location Services")
        }
        // MARK: What does it do?
        
        
    }

    func setupSubviews() {
        self.view.addSubview(backView)
        self.view.addSubview(mapView)
    }
    
    func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                     backView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                     backView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                                     backView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)])
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mapView.topAnchor.constraint(equalTo: backView.topAnchor),
                                     mapView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
                                     mapView.leftAnchor.constraint(equalTo: backView.leftAnchor),
                                     mapView.rightAnchor.constraint(equalTo: backView.rightAnchor)])
    }
    
    // MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // MARK: Method 1.
//        // NOTE: The shorter the value, the more the map is zoomed in.
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), latitudinalMeters: 0.2, longitudinalMeters: 0.2)
//        // NOTE: Whenever region is updated the Map View will move to that region.
//        self.mapView.setRegion(region, animated: true)
        // MARK: Method 2.
//        if let location = locations.last{
//            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            self.mapView.setRegion(region, animated: true)
//        }
        // MARK: Method 3.
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
        print("didUpdateLocations")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // TODO: Handle invalid location.
        print("Location unaccessable")
        print(error)
    }
}

