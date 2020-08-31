//
//  PointService.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import PromisedFuture

class PointService: BaseService {
    static func getPoints(lower: String, upper: String) -> Future<PointsData, Error> {
        return self.performRequest(route: ServiceRouter.points(lower: lower, upper: upper))
    }
}
