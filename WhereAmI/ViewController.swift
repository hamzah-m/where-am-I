//
//  ViewController.swift
//  WhereAmI
//
//  Created by Hamzah Mugharbil on 7/30/20.
//  Copyright © 2020 Hamzah Mugharbil. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var ipLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showIPData()
    }
    
    func showIPData() {
        // google's ip
//        let url: URL = URL(string: "https://ipinfo.io/8.8.8.8/geo")!
        
        // your ip
        let url: URL = URL(string: "https://ipinfo.io/geo")!
        
        let decoder = JSONDecoder()
        
        do {
            let rawData = try Data(contentsOf: url)
            let data: IPData = try decoder.decode(IPData.self, from: rawData)
            ipLabel.text = "ip: \(data.ip)"
            cityLabel.text = "city: \(data.city)"
            countryLabel.text = "country: \(data.country)"
            stateLabel.text = "state: \(data.region)"
            
            let coor = data.loc.split(separator: ",")
            let lat: CLLocationDegrees = CLLocationDegrees(coor[0])!
            let lon: CLLocationDegrees = CLLocationDegrees(coor[1])!
            let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            map.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            map.addAnnotation(annotation)
            
        } catch {
            print("Decoder failed: \(error)")
        }
    }


}

