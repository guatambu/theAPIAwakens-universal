//
//  StarWarsURLPaths.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 12/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum StarWarsURLPaths {

    case films
    case people
    case planets
    case spaceships
    case species
    case vehicles
}

extension StarWarsURLPaths: CustomStringConvertible {    
    var description: String {
        switch self {
        case .films: return "films"
        case .people: return "people"
        case .planets: return "planets"
        case .spaceships: return "spaceships"
        case .species: return "species"
        case .vehicles: return "vehicles"
        }
    }
}


