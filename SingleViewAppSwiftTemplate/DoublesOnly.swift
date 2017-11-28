//
//  DoublesOnly.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/28/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


extension String {
    var doublesOnly: String {
        let doubles = self.replacingOccurrences(of: "[^0-9.]", with: "", options: .regularExpression, range:nil)
        return doubles
    }
}
