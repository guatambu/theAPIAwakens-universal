//
//  VehicleViewModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 11/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct VehicleViewModel {
    
    // Vehicle ID
    let id: Int
    // Vehicle Full name
    let name: String
    // Make
    let make: String
    // Cost
    let cost_in_credits: String
    // Length
    let length: String
    // Class
    let vehicle_class: String
    // Crew
    let crew: String
    
    init(model: Vehicle){
        self.id = 1
        self.name = model.name
        self.make = model.make
        let cost_in_credits_Int = Int(model.cost_in_credits)
        self.cost_in_credits = "\(String(describing: cost_in_credits_Int))"
        let lengthInt = Int(model.length)
        self.length = "\(String(describing: lengthInt))m"
        self.vehicle_class = model.vehicle_class
        self.crew = model.crew
    }
    
}



