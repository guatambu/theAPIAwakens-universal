//
//  CreditsUSDollarsConversion.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class CreditsUSDollarsConversion {
    
    var conversionRate: Double = 0
    var amountInCredits: Double = 0
    var amountInUSDollars: Double = 0
    
    func convertCreditsToUSDollars() {
        return amountInUSDollars = amountInCredits * conversionRate
    }
    
    func convertUSDollarsToCredits() {
        return amountInCredits = amountInUSDollars / conversionRate
    }
    
    
}
