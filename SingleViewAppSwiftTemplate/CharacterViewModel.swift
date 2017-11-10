//
//  CharacterViewModel.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 11/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct CharacterViewModel {
    
    // Character ID
    let id: Int
    // Character Name
    let name: String
    // Born
    let birth_year: String
    // Home
    let homeworld: String
    // Height
    let height: String
    // Eyes
    let eyes: String
    // Hair
    let hair: String
    
    init(model: Character){
        self.id = 1
        self.name = model.name
        self.birth_year = model.birth_year
        self.homeworld = model.homeworld
        let heightInt = Int(model.height)
        self.height = "\(String(describing: heightInt))m"
        self.eyes = model.eyes
        self.hair = model.hair
    }
    
}





