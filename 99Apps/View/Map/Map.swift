//
//  Map.swift
//  99Apps
//
//  Created by herlangga wibi on 07/08/20.
//  Copyright © 2020 herlangga wibi. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class Map: UIViewController {

    @IBOutlet private var mapView: MKMapView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var priceProperty: UILabel!
    @IBOutlet weak var imgProperty: UIImageView!
    @IBOutlet weak var titleProperty: UILabel!
    @IBOutlet weak var locationProperty: UILabel!
    
    var list: [List]?
    var annotations: [MyAnnotation]?
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
        
        setAnnotation()
    }
    
    private func configureMap() {
        mapView.delegate = self
        detailsView.alpha = 0
    }
    
    private func setAnnotation() {
        
        
        for i in 0...(list?.count ?? 1) - 1 {
            let annotation = MyAnnotation()
            annotation.id = list?[i].id
            let latitude = list![i].location.latitude
            let longitude = list![i].location.longitude
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude.doubleValue, longitude: longitude.doubleValue)
            
            mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func infoDetailsTap(_ sender: UITapGestureRecognizer) {
        let vc = Details()
        vc.details = list?[selectedIndex ?? 0]
        navigationController?.pushViewController(vc, animated: true)
    }

    func animate(alpha: CGFloat) {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: { [weak self] in
            self?.detailsView.alpha = alpha
        }, completion: nil)
    }
    
    private func setInfoProperty(index id: Int) {
        let source = DataImg(url: URL(string: list?[id].image ?? "")!, cacheKey: "")
        imgProperty.kf.setImage(with: source)
        priceProperty.text = list?[id].attribute.price
        titleProperty.text = list?[id].title
        locationProperty.text = list?[id].location.address
        
    }
}

extension Map: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        animate(alpha: 1)
        let annotation = view.annotation as! MyAnnotation
        let id = Int(annotation.id!)
        selectedIndex = id
        setInfoProperty(index: id ?? 0)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        animate(alpha: 0)
    }
    
}

private extension MKMapView {
    
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 100000, annotation: MKAnnotation) {
        
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        
        
        setRegion(coordinateRegion, animated: true)
        
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

class MyAnnotation: MKPointAnnotation {
    
    var id: String?
    
}

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}
