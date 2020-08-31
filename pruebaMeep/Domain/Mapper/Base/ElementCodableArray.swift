//
//  ElementCodableArray.swift
//  pruebaMeep
//
//  Created by jvictorio on 31/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

/**
 * Support structure that parses an item list.
 */
struct ElementCodableArray<Element : Codable> : Codable {

    var elements: [Element]

    init(from decoder: Decoder) throws {

        var container = try decoder.unkeyedContainer()

        var elements = [Element]()
        if let count = container.count {
            elements.reserveCapacity(count)
        }

        while !container.isAtEnd {
            if let element = try container
                .decode(ElementDecodable<Element>.self).base {

                elements.append(element)
            }
        }

        self.elements = elements
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(elements)
    }
}

struct ElementCodable<Element : Codable> : Codable {
    
    var element : Element
    
    init(from decoder: Decoder) throws {
        
        
        var container = try decoder.unkeyedContainer()
        

        element = try Element.init(from: decoder)
        
        if let elementtmp = try container
            .decode(ElementDecodable<Element>.self).base {

            element = elementtmp
        }
    }
}
