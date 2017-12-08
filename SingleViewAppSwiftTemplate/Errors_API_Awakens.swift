//
//  Errors_API_Awakens.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 11/14/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum Errors_API_Awakens: Error {
    case stringNotInteger(message: String)
    case stringNotDouble(message: String)
    case requestFailed(message: String)
    case responseUnsuccessful(message: String)
    case invalidData(message: String)
    case jsonConversionFailure(message: String)
    case invalidURL(message: String)
    case jsonParsingFailure(message: String)
    
}
