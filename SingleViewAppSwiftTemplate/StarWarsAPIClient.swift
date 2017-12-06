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
        guard let url = URL(string: starWarsEntity.description, relativeTo: baseURL) else {
            completion(nil, .invalidURL("the requested URL was invlaid"))
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(wth: request) { json, error in 
            guard let json = json else {
                completion(nil, error)
                return
            }
            guard let currentStarWarsEntityArrayJson = json["results"] as? [[String: Any]], let currentStarWarsEntityArray = StarWarsEntity(json: currentStarWarsEntityArrayJson) else {
                completion(nil, .jsonParsingFailure("failed attempt to parse JSON data"))
                return
            }
            
            completion(currentStarWarsEntityArray, nil)
        }
        task.resume()
    }
}
