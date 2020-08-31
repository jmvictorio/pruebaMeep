//
//  HomeController.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeController: UIViewController {
    
    let presenter = HomePresenter()
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.setDelegate(delegate: self)
        self.presenter.onViewDidLoad()
    }
}

extension HomeController: HomeViewDelegate{
    func setupView() {
        let mapView = ManagerMap.shared.getMap(view: self.view)
        mapView.delegate = self
        self.view.addSubview(mapView)
        let bounds = mapView.projection.visibleRegion()
        let lower = "\(bounds.nearLeft.latitude),\(bounds.nearLeft.longitude)"
        let upper = "\(bounds.farRight.latitude),\(bounds.farRight.longitude)"
        self.presenter.getPoints(lower: lower, upper: upper)
    }
    
    func showError(text: String) {
        print(text)
    }
    
    func showPoints(){
        ManagerMap.shared.showPoints()
    }
}

extension HomeController : GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let bounds = mapView.projection.visibleRegion()
        let lower = "\(bounds.nearLeft.latitude),\(bounds.nearLeft.longitude)"
        let upper = "\(bounds.farRight.latitude),\(bounds.farRight.longitude)"
        self.presenter.getPoints(lower: lower, upper: upper)
    }
}
