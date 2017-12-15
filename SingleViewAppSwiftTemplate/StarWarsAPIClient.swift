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
    let session = URLSession.shared
    
    var allCollectedJSON = [String: Any]()
    
    typealias VehiclesCompletionHandler = ([Vehicle], Errors_API_Awakens?) -> Void
    
    func getJSON() {
        
    }
    
    func getVehicles(with starWarsEntityURLPath: StarWarsURLPaths, completionHandler completion: @escaping VehiclesCompletionHandler) {
        guard let url = URL(string: starWarsEntityURLPath.description, relativeTo: baseURL) else {
            completion([], .invalidURL(message: "the requested URL was invalid"))
            print(Errors_API_Awakens.invalidURL(message: "the requested URL was invalid"))
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
                
                self.allCollectedJSON = json
                
                var next = json["next"]
                
                if next != nil {
                    let nextURL = URL(string: next as! String)
// maybe i need to split up the getting of the json into a function separate from the rest of "getting a vehicle" we see here below
                    
                    /*
                     ex.:
                             var pagedJson = [String: Any]()
                             let session = URLSession.shared
                     
                             func fetchJsonForPage(_ page: Int, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
                             let request = /* Construct request for page number */
                             let task = session.dataTask(with: request) { data, response, error in
                             let json = /* Do all the usual stuff to get the json out */
                     
                             let currentPage = json["currentPage"]
                             pagedJson[currentPage] = json
                     
                             let next = json["next"]
                     
                             if next != nil {
                             self.fetchJsonForPage(currentPage + 1, completion: completion)
                             }
                     
                             task.resume()
                             }
                    */
                    
                }
                
                guard let results = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(Errors_API_Awakens.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
            
                let vehicles = results.flatMap { Vehicle(json: $0) }
                let sortedVehicles = vehicles.sorted(by: {$1.name > $0.name})
                completion(sortedVehicles, nil)
            }
        }
        task.resume()
        
    }
}


























