//
//  StarWarsEntity.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 12/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

protocol StarWarsEntity {
    var id: String { get set }
    var name: String { get set }
    var entityType: String { get set }
}
