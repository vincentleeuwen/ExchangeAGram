//
//  MapViewController.swift
//  ExchangeAGram
//
//  Created by Vincent van Leeuwen on 08/03/15.
//  Copyright (c) 2015 Vincent van Leeuwen. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
        // get all FeedItems from CoreData
        let request = NSFetchRequest(entityName: "FeedItem")
        let appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let context = appDelegate.managedObjectContext!
        var error:NSError?
        let itemArray = context.executeFetchRequest(request, error: &error)
        println(error)
        
        if itemArray!.count > 0 {
            for item in itemArray! {
                // get location from feeditem
                let location = CLLocationCoordinate2D(latitude: Double(item.latitude), longitude: Double(item.longitude))
                // set area around location
                let span = MKCoordinateSpanMake(0.05, 0.05)
                // set the region using loaction and area around location
                let region = MKCoordinateRegionMake(location, span)
                // pass region to mapview
                mapView.setRegion(region, animated: true)
                
                // initialize annotation
                let annotation = MKPointAnnotation()
                // set coordinate for annotation
                annotation.setCoordinate(location)
                annotation.title = item.caption
                
                mapView.addAnnotation(annotation)
                
            }
        }
        
//        // set specific loaction
//        let location = CLLocationCoordinate2D(latitude: 48.868639224587, longitude: 2.37119161036255)
//        // calculate the area around location
//        let span = MKCoordinateSpanMake(0.05, 0.05)
//        // set the region using locaiton and area
//        let region = MKCoordinateRegionMake(location, span)
//        // pass region to mapview
//        mapView.setRegion(region, animated: true)
//        
//        // initialize annotation
//        let annotation = MKPointAnnotation()
//        // set coordinate for annotation
//        annotation.setCoordinate(location)
//        // set title, subtitle
//        annotation.title = "Canal Saint-Martin"
//        annotation.subtitle = "Paris"
//        
//        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
