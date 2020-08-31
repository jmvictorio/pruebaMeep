//
//  Constants.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

struct Constants {
    /**ViewController identifiers*/
    struct Controllers {
        static let identifierHomeController: String = "homeController"
    }
    
    struct Service{        
        enum ContentType: String {
            case json = "application/json"
        }
        
        enum HTTPHeaderField: String {
            case authentication = "Authorization"
            case contentType = "Content-Type"
            case acceptType = "Accept"
            case acceptEncoding = "Accept-Encoding"
        }
        
        static let baseURL = "apidev.meep.me"
        static let scheme: String = "https"
    }
}
