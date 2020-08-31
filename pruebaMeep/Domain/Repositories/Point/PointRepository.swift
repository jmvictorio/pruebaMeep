//
//  PointRepository.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit
import PromisedFuture

protocol PointRepository {
    func getPoints(lower: String, upper: String) -> Future<PointsData, Error>
}
