//
//  PointRepository.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import PromisedFuture

class PointRepositoryNetwork: PointRepository {
    func getPoints(lower: String, upper: String) -> Future<PointsData, Error> {
        return PointService.getPoints(lower: lower, upper: upper)
    }
}
