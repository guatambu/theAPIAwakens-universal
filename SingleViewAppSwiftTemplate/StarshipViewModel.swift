//
//  StarshipViewModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct StarshipViewModel {
    // Length
    var length: String
    // Pilots
    var pilots: [Any]
    // Crew
    var crew: String
    // Name
    var name: String
    // Films
    var films: [Any]
    // Model
    var model: String
    // Cost
    var costInCredits: String
    // Cargo Capacity
    var cargoCapacity: String
    // Maximum Atmosphering Speed
    var maxAtmospheringSpeed: String
    //  Last Edited Time Stamp
    var edited: String
    // Created Time Stamp
    var created: String
    // Passengers
    var passengers: String
    // Class
    var starshipClass: String
    // HyperDrive Rating
    var hyperdriveRating: String
    // MGLT
    var mglt: String
    // Consumables
    var consumables: String
    // Make
    var make: String
    // URL Location
    var url: String
    
    init(model: Starship) throws {
        guard let length_Double = Double(model.length) else {
            throw Errors_API_Awakens.stringNotDouble(message: "the value of this property is a String not a Double")
        }
        self.length = "\(length_Double)m"
        self.pilots = model.pilots
        self.crew = model.crew
        self.name = model.name
        self.films = model.films
        self.model = model.model
        do {
            guard let costInCreditsInt = Int(model.costInCredits) else {
                throw Errors_API_Awakens.stringNotInteger(message: "the value of this property is a String not an Integer")
            }
            self.costInCredits = "\(costInCreditsInt)"
        } catch Errors_API_Awakens.stringNotInteger {
            self.costInCredits = model.costInCredits
        }
        self.cargoCapacity = model.cargoCapacity
        self.maxAtmospheringSpeed = model.maxAtmospheringSpeed
        self.edited = model.edited
        self.created = model.created
        self.passengers = model.passengers
        self.starshipClass = model.starshipClass
        self.hyperdriveRating = model.hyperdriveRating
        self.mglt = model.mglt
        self.consumables = model.consumables
        self.make = model.make
        self.url = model.url
    }    
}



