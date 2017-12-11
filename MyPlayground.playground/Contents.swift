//: Playground - noun: a place where people can play

import UIKit

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


let x = StarWarsURLPaths.films
print(x)





