//
//  ServiceRouter.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import Alamofire

enum ServiceRouter: ServiceConfiguration {
    
    // example: case login(email:String, password:String)
    case points(lower: String, upper: String)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .points:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .points:
            return "/tripplan/api/v1/routers/lisboa/resources"
        }
    }
    
    // MARK: - QueryParameters
    var queryParameters: [URLQueryItem]? {
        switch self {
        case .points(let lower, let upper):
            return [URLQueryItem(name: "lowerLeftLatLon", value: lower),
                    URLQueryItem(name: "upperRightLatLon", value: upper)]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url:createURL())
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        //"Accept: application/json"
        urlRequest.setValue(Constants.Service.ContentType.json.rawValue,
                            forHTTPHeaderField: Constants.Service.HTTPHeaderField.acceptType.rawValue)
        //"Content-Type: application/json"
        urlRequest.setValue(Constants.Service.ContentType.json.rawValue,
                            forHTTPHeaderField: Constants.Service.HTTPHeaderField.contentType.rawValue)
        
        
        return urlRequest
    }
    
    func createURL() -> URL {
        let urlComponents = NSURLComponents()
        urlComponents.scheme = Constants.Service.scheme
        urlComponents.host = Constants.Service.baseURL
        urlComponents.path =  self.path
        urlComponents.queryItems = self.queryParameters
        
        guard let url = urlComponents.url else { return URL(string: Constants.Service.baseURL)! }
        
        return url
        
    }
}
