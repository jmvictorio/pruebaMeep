//
//  Mapper.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

class Mapper<Element : Codable> {

    /**
      Method responsible for parsing a json in swift manageable object.
     - Parameter json: The json data.
     
      ````
      Mapper<[classToParser]>.mapperElement([data json])
      ````
     */
    static func mapperElement(withJSONData json: Data) -> Any {
        
        do {
            let decoder = JSONDecoder()
            let element = try decoder.decode(Element.self, from: json)
            return element
          
        } catch {
            NSLog("Error mapping element: \(error)")
            return Element.self
        }
    }
    
    /**
      Method responsible for parsing a json in swift manageable object.
     - Parameter json: The json data.
     
      ````
      Mapper<[classToParser]>.mapperElement([data json])
      ````
     */
    static func mapperElementArray(withJSONData json: Data) -> [Any] {
        
        do {
            let decoder = JSONDecoder()
            let elements = try decoder.decode([Element].self, from: json)

            return elements
          
        } catch {
            NSLog("Error mapping element: \(error)")
        }
        
        return [Any]()
    }
}
