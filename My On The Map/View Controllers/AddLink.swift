//
//  AddLink.swift
//  On The Map
//
//  Created by Brittany Mason on 10/2/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class addLink : UIViewController, MKMapViewDelegate {

    @IBOutlet weak var fullMapView: MKMapView!
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateMapView()
    }

    private func populateMapView(){

        var annotations = [MKPointAnnotation]()
        let lat = CLLocationDegrees(parametersAll.StudentLocation.latitude)
        let lon = CLLocationDegrees(parametersAll.StudentLocation.longitude)
        let coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "\(parametersAll.StudentLocation.firstName) \(parametersAll.StudentLocation.lastName)"
        annotation.subtitle = parametersAll.StudentLocation.mediaURL
        annotations.append(annotation)

        /* Zoom into a specific region */
        let span = MKCoordinateSpan.init(latitudeDelta: 1, longitudeDelta: 1)
        let region = MKCoordinateRegion(center: coordinate, span: span)

        performUIUpdatesOnMain {
            self.fullMapView.addAnnotations(annotations)
            self.fullMapView.setRegion(region, animated: true)
            print("New location added to the Map View.")
        }
    }







}
