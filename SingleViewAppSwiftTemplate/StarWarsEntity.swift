//
//  StarWarsEntity.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 12/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class StarWarsEntity {
    
    // Entity ID
    var id: Int
    // Entity Type
    var entityType: String
    // Entity Name
    var name: String
    
    init(id: Int, entityType: String, name: String) {
        self.id = id
        self.entityType = entityType
        self.name = name
    }
    
}
