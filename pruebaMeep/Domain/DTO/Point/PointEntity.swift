//
//  PointEntity.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import GoogleMaps

class PointEntity {
    
    var pointId, name: String
    var x, y: Double
    var scheduledArrival, locationType: Int?
    var companyZoneID: Int
    var lat, lon: Double?
    var licencePlate: String?
    var range, batteryLevel, helmets: Int?
    var model: String?
    var resourceImageID: String?
    var realTimeData: Bool?
    var resourceType: String?
    var station: Bool?
    var availableResources, spacesAvailable: Int?
    var allowDropoff: Bool?
    var bikesAvailable: Int?
    
    init(model: PointData){
        self.pointId = model.id
        self.name = model.name
        self.x = model.x
        self.y = model.y
        self.scheduledArrival = model.scheduledArrival
        self.locationType = model.locationType
        self.companyZoneID = model.companyZoneID
        self.lat = model.lat ?? model.y
        self.lon = model.lon ?? model.x
        self.licencePlate = model.licencePlate
        self.range = model.range
        self.batteryLevel = model.batteryLevel
        self.helmets = model.helmets
        self.model = model.model
        self.resourceType = model.resourceType
        self.resourceImageID = model.resourceImageID
        self.realTimeData = model.realTimeData
        self.station = model.station
        self.availableResources = model.availableResources
        self.spacesAvailable = model.spacesAvailable
        self.allowDropoff = model.allowDropoff
        self.bikesAvailable = model.bikesAvailable
    }
    
    func getMarker() -> GMSMarker{
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: self.lat!, longitude: self.lon!)
        marker.title = self.name
        marker.snippet = self.model
        
        return marker
    }
}
