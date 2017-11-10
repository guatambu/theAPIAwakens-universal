//
//  StarshipViewModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 11/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct StarshipViewModel {
    
    // Starhip ID
    let id: Int
    // Starship Full name
    let name: String
    // Make
    let make: String
    // Cost
    let cost_in_credits: String
    // Length
    let length: String
    // Class
    let starship_class: String
    // Crew
    let crew: String
    
    init(model: Starship){
        self.id = 1
        self.name = model.name
        self.make = model.make
        let cost_in_credits_Int = Int(model.cost_in_credits)
        self.cost_in_credits = "\(String(describing: cost_in_credits_Int))"
        let lengthInt = Int(model.length)
        self.length = "\(String(describing: lengthInt))m"
        self.starship_class = model.starship_class
        self.crew = model.crew
    }
    
}



