//
//  Errors_API_Awakens.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 11/14/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


enum Errors_API_Awakens: Error {
    case stringNotInteger(String)
    case stringNotDouble(String)
    case requestFailed(String)
    case responseUnsuccessful(String)
    case invalidData(String)
    case jsonConversionFailure(String)
    case invalidURL(String)
    case jsonParsingFailure(String)
    
}
