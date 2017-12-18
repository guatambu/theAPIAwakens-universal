//
//  StarWarsAPIClient.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 12/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation


class StarWarsAPIClient {
    
    let downloader = JSONDownloader()
    let session = URLSession.shared
    
    var allCollectedJSON = [String: Any]()
    var endpoint = SWAPI.vehicles(page: nil)
    var pageNumber = 2
    var allDownloadedVehicles = [Vehicle]()
    
    typealias VehiclesCompletionHandler = ([Vehicle], Errors_API_Awakens?) -> Void
    
    func getVehicles(with starWarsEntityURLPath: Endpoint, completionHandler completion: @escaping VehiclesCompletionHandler) {
        
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 29?"))
                    print(Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 29?"))
                    return
                }
               
                self.allCollectedJSON = json
 
                guard let results = self.allCollectedJSON["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(Errors_API_Awakens.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }

                let vehicles: [Vehicle] = results.flatMap { Vehicle(json: $0) }
                let sortedVehicles: [Vehicle] = vehicles.sorted(by: {$1.name > $0.name})
                self.allDownloadedVehicles.append(contentsOf: sortedVehicles)
                
                let next = json["next"]
                if next != nil {
                    
                    self.endpoint = SWAPI.vehicles(page: "\(self.pageNumber)")
                    self.getVehicles(with: self.endpoint, completionHandler: completion)
                    self.pageNumber += 1
                    
                } else {
                    self.endpoint = SWAPI.vehicles(page: nil)
                    print("endpoint has been reset to: \(self.endpoint)")
                    self.pageNumber = 2
                    print("\(self.pageNumber)")
                    self.allCollectedJSON = [:]
                    
                }
                
                self.allDownloadedVehicles = self.allDownloadedVehicles.sorted(by: {$1.name > $0.name})
                completion(sortedVehicles, nil)
            }
        }
        task.resume()
    }
}



























