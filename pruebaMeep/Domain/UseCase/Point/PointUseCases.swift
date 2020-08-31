//
//  PointUseCases.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import PromisedFuture

struct PointUseCases {
    func getPoints(strategy: Strategy, lower: String, upper: String) -> Future<[PointEntity], Error>{
        return PointRepositoryFactory().create(strategy: strategy)!.getPoints(lower: lower, upper: upper).map { PointMapper.convert(points: $0) }
    }
}
