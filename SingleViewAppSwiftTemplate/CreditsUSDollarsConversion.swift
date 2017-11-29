//
//  CreditsUSDollarsConversion.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/29/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class CreditsUSDollarsConversion {
    
    func convertCreditsToUSDollars(_ costInCredits: Double, _ rate: Double) -> Double {
        let dollars = costInCredits * rate
        return dollars
    }
    
    func convertUSDollarsToCredits(_ costInDollars: Double, _ rate: Double) -> Double {
        let credits = costInDollars / rate
        return credits
    }
}
