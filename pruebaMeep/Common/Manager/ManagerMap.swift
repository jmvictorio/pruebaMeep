//
//  ManagerMap.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import GoogleMaps

class ManagerMap {
    
    static let shared = ManagerMap()
    static let apiKey = "AIzaSyCDi8q08rH5-6k7_7BoqqXDIyz7bRNO7po"
    
    static let LatLisbon = 38.726623
    static let LonLisbon = -9.14952
    
    private var mapView: GMSMapView?
    private var points: [GMSMarker] = []
 
    func start(){
        GMSServices.provideAPIKey(ManagerMap.apiKey)
    }
    
    func getMap(view: UIView? = nil) -> GMSMapView{
        guard let map = self.mapView else{
            let camera = GMSCameraPosition.camera(withLatitude: ManagerMap.LatLisbon, longitude: ManagerMap.LonLisbon, zoom: 14)
            let mapView = GMSMapView.map(withFrame: view!.frame, camera: camera)
            ManagerMap.shared.mapView = mapView
            return mapView
        }
        return map
    }
    
    func removeMarkers(){
        self.mapView?.clear()
    }
    
    func showPoints(){
        self.removeMarkers()
        for point in self.points{
            point.map = ManagerMap.shared.mapView
        }
    }
    
    func setPoints(list: [PointEntity]){
        self.points = []
        for point in list{
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: point.lat ?? 0, longitude: point.lon ?? 0)
            marker.title = point.name
            marker.snippet = point.model
            marker.appearAnimation = .pop
            marker.tracksInfoWindowChanges = false
            marker.icon = self.getColorForMarker(companyZoneId: point.companyZoneID)
            marker.opacity = 0.9

            self.points.append(marker)
        }
    }
    
    private func getColorForMarker(companyZoneId: Int) -> UIImage{
        var color : UIColor = .red
        switch companyZoneId {
            case 378:
                color = .systemPurple
                break
            case 382:
                color = .black
                break
            case 402:
                color = .systemBlue
                break
            case 412:
                color = .brown
                break
            case 473:
                color = .systemGreen
                break
            default:
                color = .red
        }
        return GMSMarker.markerImage(with: color)
    }
}
