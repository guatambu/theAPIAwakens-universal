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
    
    typealias VehiclesCompletionHandler = ([Vehicle], Errors_API_Awakens?) -> Void
    
    func getVehicles(with starWarsEntityURLPath: StarWarsURLPaths, completionHandler completion: @escaping VehiclesCompletionHandler) {
        guard let url = URL(string: starWarsEntityURLPath.description, relativeTo: baseURL) else {
            completion([], .invalidURL(message: "the requested URL was invlaid"))
            print(Errors_API_Awakens.invalidURL(message: "the requested URL was invlaid"))
            return
        }
        let request = URLRequest(url: url)
        let task = downloader.jsonTask(with: request) { json, error in 
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 29?"))
                    print(Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 29?"))
                    return
                }
                guard let results = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(Errors_API_Awakens.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
                
                let vehicles = results.flatMap { Vehicle(json: $0) }
                completion(vehicles, nil)
                print("\n\n\nhere are the vehicles: \n\(vehicles)")
                
            }
        }
        task.resume()
        
    }
}


























