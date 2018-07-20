//
//  ViewController.swift
//  MAP_LOCATION
//
//  Created by Đỗ Hoàng Vũ on 7/19/18.
//  Copyright © 2018 Đỗ Hoàng Vũ. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
class ViewController: UIViewController {
    var fetchToken = FetchToken()

    private let locationManager = CLLocationManager()
    @IBOutlet weak var my_MapView: GMSMapView!
    var token : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        fetchToken.postAction()
   
    }
 
    //nút click để về vị trí hiện tại
    @IBAction func didTapMyLocationButton(_ sender: UIButton) {
        didTapMyLocationButton(for: my_MapView)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        
        guard let lat = my_MapView.myLocation?.coordinate.latitude,
            let lng = my_MapView.myLocation?.coordinate.longitude else { return false }
        
        let camera = GMSCameraPosition.camera(withLatitude: lat ,longitude: lng , zoom: 15)
        my_MapView.animate(to: camera)
        return true
    }
}

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        guard status == .authorizedWhenInUse else {
            return
        }
        // 4
        locationManager.startUpdatingLocation()
        //5
        my_MapView.isMyLocationEnabled = true
    }
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.my_MapView.padding = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0,
                                               bottom: 0, right: 0)
        // 7
        my_MapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        // 8
        locationManager.stopUpdatingLocation()
    }
}
