//
//  BaseRepositoryFactory.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

class BaseRepositoryFactory<T> {
    func create(strategy: Strategy = .Mock) -> T? {
        fatalError("create method must override")
    }
}
