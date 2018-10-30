//
//  MapController.swift
//  Baahubali
//
//  Created by Sharath on 10/15/18.
//  Copyright © 2018 Sharath. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate {
    
    //your location
    @IBAction func mainviewBtn(_ sender: Any) {
        let spam:MKCoordinateSpan = MKCoordinateSpanMake(1,1)
        let SDlocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.7157 , -117.1611)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(SDlocation, spam)
        map.setRegion(region, animated: true)

    
    }
    @IBOutlet weak var fromAd: UITextField!
    @IBOutlet weak var toAd: UITextField!
    var coordinates=[Double]()
    
    //find button
    @IBAction func directbtn(_ sender: Any) {
        //fromLocation

        var fromlat = Double()
        var fromlong = Double()
        let fromlocator = CLGeocoder()
        fromlocator.geocodeAddressString(fromAd.text!)
        {(placemarks, errors) in
            if let place = placemarks?[0] {
                //From location name
                fromlat = (place.location?.coordinate.latitude)!
                fromlong = (place.location?.coordinate.longitude)!
                self.coordinates.append(fromlat)
                self.coordinates.append(fromlong)
            } else {
                self.setAlert(title: "Oops!", message: "Enter To Location ")
            }

            self.ToLocator()
        }
    }
    func ToLocator()
    {
        var tolat=Double()
        var tolong=Double()
        let tolocator = CLGeocoder()
        tolocator.geocodeAddressString(toAd.text!)
        { (placemarks, errors) in
            if let place = placemarks?[0] {
                //to location name
                tolat = (place.location?.coordinate.latitude)!
                tolong = (place.location?.coordinate.longitude)!
                self.coordinates.append(tolat)
                self.coordinates.append(tolong)
                print(self.coordinates.count)
                self.SetDirect(self.coordinates)
            } else {
               // print( "Please Check the data " )
                self.setAlert(title: "Oops!", message: "Enter To Location ")
            }

        }
       
    }
    func SetDirect(_: [Double]){
        print(self.coordinates.count)
        let fromlat = coordinates[0]
        let fromlong = coordinates[1]
        let tolat = coordinates[2]
        let tolong = coordinates[3]
        let fromlocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(fromlat , fromlong )
        let point1 = MKPointAnnotation()
        point1.coordinate = fromlocation
        point1.title = "From Location"
        self.map.addAnnotation(point1)
        
        let tolocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(tolat , tolong )
        let point2 = MKPointAnnotation()
        point2.coordinate = tolocation
        point2.title = "To Location"
        self.map.addAnnotation(point2)
        
        //directions
        let fromPlaceMark = MKPlacemark(coordinate: fromlocation)
        let toPlaceMark = MKPlacemark(coordinate: tolocation)
        let directionReq = MKDirectionsRequest()
        directionReq.source = MKMapItem(placemark: fromPlaceMark)
        directionReq.destination = MKMapItem(placemark: toPlaceMark)
        directionReq.transportType = .automobile
        let directions = MKDirections(request: directionReq)
        directions.calculate{(response, error) in
            guard let directionResponse = response else{
                        if error != nil{
                            self.setAlert(title: "Oops!", message: "Something went wrong ")
                        }
                        return
                    }
        let routeline = directionResponse.routes[0]
        self.map.add(routeline.polyline, level: .aboveRoads)
        
        let rect = routeline.polyline.boundingMapRect
        self.map.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
                }
                self.map.delegate = self
            }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
            {
                let renderValue = MKPolylineRenderer(overlay: overlay)
                renderValue.strokeColor = UIColor.blue
                renderValue.lineWidth = 2.0
                return renderValue
    }

    @IBAction func myLoc(_ sender: Any) {
        currLocation.desiredAccuracy = kCLLocationAccuracyBest
        currLocation.requestWhenInUseAuthorization()
        currLocation.startUpdatingLocation()
    }
    @IBOutlet weak var map: MKMapView!
    let currLocation = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locate = locations[0]
        let ratio:MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
        let mylocate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(locate.coordinate.latitude, locate.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(mylocate, ratio)
        map.setRegion(region, animated: true)
        print("vosthundhi ra ayya")
        self.map.showsUserLocation = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currLocation.delegate = self
       
        //first view
        let spam:MKCoordinateSpan = MKCoordinateSpanMake(1,1)
        let SDlocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.7157 , -117.1611)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(SDlocation, spam)
        map.setRegion(region, animated: true)
        
        //point1
        let EClocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.7948 , -116.9625 )
        let point1 = MKPointAnnotation()
        point1.coordinate = EClocation
        point1.title = "ElCajon"
        map.addAnnotation(point1)
        
        //point2
        let EDlocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.132966, -117.079936)
        let point2 = MKPointAnnotation()
        point2.coordinate = EDlocation
        point2.title = "Escondido"
        map.addAnnotation(point2)
        
        
        //directions
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setAlert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion : nil)
        }))
        self.present(alert, animated:true, completion:nil)
    }
}

