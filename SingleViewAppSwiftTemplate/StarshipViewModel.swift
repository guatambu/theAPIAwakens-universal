//
//  StarshipViewModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct StarshipViewModel {
    
    // Starhip ID
    let id: String
    // Starship Entity Type
    let entityType: String
    // Starship Full name
    let name: String
    // Make
    let make: String
    // Cost
    let costInCredits: String
    // Length
    let length: String
    // Class
    let starshipClass: String
    // Crew
    let crew: String
    
    init(model: Starship) throws {
        self.id = model.id
        self.entityType = model.entityType
        self.name = model.name
        self.make = model.make
        
        do {
            guard let costInCreditsInt = Int(model.costInCredits) else {
                throw Errors_API_Awakens.stringNotInteger("the value of this property is a String not an Integer")
            }
            self.costInCredits = "\(costInCreditsInt)"
        } catch Errors_API_Awakens.stringNotInteger {
            self.costInCredits = model.costInCredits
        }
        
        guard let length_Double = Double(model.length) else {
            throw Errors_API_Awakens.stringNotDouble("the value of this property is a String not a Double")
        }
        self.length = "\(length_Double)m"
        
        self.starshipClass = model.starshipClass
        self.crew = model.crew
    }
    
}



