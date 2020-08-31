//
//  BaseService.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

import Alamofire
import PromisedFuture

class BaseService {
    
    @discardableResult
    static func performRequest<T:Decodable>(route:ServiceConfiguration, decoder: JSONDecoder = JSONDecoder()) -> Future<T, Error> {
        return Future(operation: { completion in
            AF.request(route).validate(statusCode: 200..<300).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                
                self.printResponseDescription(responseData: response.data, responseRequest: response.request, response: response.response, error: response.error)

                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    ServiceInterceptor.checkResponseError(statusCode: response.response?.statusCode, error: response.error)
                    completion(.failure(error))
                }
            })
        })
    }
    
    static private func printResponseDescription(responseData: Data?, responseRequest: URLRequest?, response: HTTPURLResponse?, error: AFError?) {
        let dic = ProcessInfo.processInfo.environment
        if let debug = dic["debug"] , debug == "true" {
            
            print("Request: \(String(describing: responseRequest))")
            
            if let data = responseData, let utf8Text = String(data: data, encoding: .utf8) {
                print("Response: \(utf8Text)")
            }
        }
    }
}


