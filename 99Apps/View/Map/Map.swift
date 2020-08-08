//
//  Map.swift
//  99Apps
//
//  Created by herlangga wibi on 07/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit
import MapKit

class Map: UIViewController {

    @IBOutlet private var mapView: MKMapView!
    @IBOutlet weak var detailsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
        
        let initialLocation = CLLocation(latitude: -6.957641, longitude: 107.639474)
        let location = CLLocationCoordinate2D(latitude: -6.957641, longitude: 107.639474)
        let annotation = tes(title: "", location: "", discipline: "", coordinate: location)
        mapView.centerToLocation(initialLocation, annotation: annotation)
        
    }
    
    private func configureMap() {
        mapView.delegate = self
        detailsView.alpha = 0
    }
    
    @IBAction func infoDetailsTap(_ sender: UITapGestureRecognizer) {
        let vc = Details()
        navigationController?.pushViewController(vc, animated: true)
    }

    func animate(alpha: CGFloat) {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: { [weak self] in
            self?.detailsView.alpha = alpha
        }, completion: nil)

    }
}

extension Map: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        animate(alpha: 1)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        animate(alpha: 0)
    }
    
}

private extension MKMapView {
    
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000, annotation: MKAnnotation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        
        
        setRegion(coordinateRegion, animated: true)
        
        addAnnotation(annotation)
//        setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: coordinateRegion), animated: true)
//
//        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
//        setCameraZoomRange(zoomRange, animated: true)
    }
}


class tes: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String?
    let discipline: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, location: String?, discipline: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = location
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    
}
