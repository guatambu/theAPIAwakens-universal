//
//  StarWarsAPIClient.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 12/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class StarWarsAPIClient {
    lazy var baseURL: URL = {
        return URL(string: "https://swapi.co/api/")!
    }()
    
    let downloader = JSONDownloader()
    
    typealias StarWarsEntityCompletionHandler = (StarWarsEntity?, Errors_API_Awakens?) -> Void
    
    func getStarWarsUserRequest(with starWarsEntity: StarWarsEntity, completionHandler completion: @escaping StarWarsEntityCompletionHandler) {
        guard let url = URL(string: starWarsEntity.entityType, relativeTo: baseURL) else {
            completion(nil, .invalidURL("the requested URL was invlaid"))
            return
        }
        
    }
}
