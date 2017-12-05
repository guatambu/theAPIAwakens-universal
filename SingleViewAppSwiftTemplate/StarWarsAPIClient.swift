//
//  StarWarsAPIClient.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 12/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class StarWarsAPIClient {
    lazy var baseURL: URL = {
        return URL(string: "https://swapi.co/api/")!
    }()
    
    let downloader = JSONDownloader()
    
    func getStarWarsUserRequest(with userRequest: StarWarsAPIUserRequest, completionHandler completion: @escaping (/*currentSomething/entity*/, Errors_API_Awakens)) {
        
    }
}
