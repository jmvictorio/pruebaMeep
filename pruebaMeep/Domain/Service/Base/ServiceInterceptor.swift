//
//  ServiceInterceptor.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import Alamofire

class ServiceInterceptor {
    
    static func checkResponseError(statusCode: Int?, error: AFError?) {
        print("Hubo un error con el código \(statusCode ?? 0), y la siguiente descripción… \(error?.localizedDescription ?? "")")
    }
    
}
