//
//  PointRepositoryFactory.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//


import UIKit

class PointRepositoryFactory: BaseRepositoryFactory<PointRepository> {
    override func create(strategy: Strategy = .Mock) -> PointRepository? {
        switch strategy {
        case .Mock:
            return PointRepositoryMock()
        case .Network:
            return PointRepositoryNetwork()
        default:
            return PointRepositoryMock()
        }
    }
}
