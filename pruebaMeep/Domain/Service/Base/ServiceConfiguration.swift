//
//  ServiceConfiguration.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import Foundation

import Alamofire

protocol ServiceConfiguration: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    var path: String { get }
    var queryParameters: [URLQueryItem]? { get }
    
}
