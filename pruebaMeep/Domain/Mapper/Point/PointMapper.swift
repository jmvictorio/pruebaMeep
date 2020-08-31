//
//  PointMapper.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import Foundation

class PointMapper: NSObject {
    static func convert(points: PointsData) -> [PointEntity] {
        return points.map({ self.convert(model: $0) })
    }
    
    static func convert(model: PointData) -> PointEntity {
        return PointEntity(model: model)
    }
    
    static func convert(data: Data) -> PointsData {
        return Mapper<PointsData>.mapperElement(withJSONData: data) as! PointsData // get the objects from the data.
    }
}
