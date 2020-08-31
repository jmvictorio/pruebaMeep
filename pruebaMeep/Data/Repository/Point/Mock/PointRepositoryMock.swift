//
//  PointRepositoryMock.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import PromisedFuture

class PointRepositoryMock: PointRepository {
    func getPoints(lower: String, upper: String) -> Future<PointsData, Error> {
        let points = self.readFromJson()
        return Future<PointsData, Error>.init(value: points!)
    }
    
    private func readFromJson() -> PointsData? {
        if let path = Bundle.main.path(forResource: "json_points", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) // recover file data.
                return PointMapper.convert(data: data) // get the objects from the data.
                
            } catch {
                 NSLog("Error try parsing points: \(error)")
            }
        }
        return nil
    }
}
