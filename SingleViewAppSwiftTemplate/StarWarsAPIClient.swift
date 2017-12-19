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
    
    var endpoint = SWAPI.vehicles(page: nil)
    var pageNumber = 2
    
    var allVehiclesJSON = [String: Any]()
    var allStarshipsJSON = [String: Any]()
    var allPeopleJSON = [String: Any]()
    
    var allDownloadedVehicles = [Vehicle]()
    var allDownloadedStarships = [Starship]()
    var allDownloadedPeople = [Character]()
    
    typealias VehiclesCompletionHandler = ([Vehicle], Errors_API_Awakens?) -> Void
    typealias StarshipsCompletionHandler = ([Starship], Errors_API_Awakens?) -> Void
    typealias CharactersCompletionHandler = ([Character], Errors_API_Awakens?) -> Void

    
    func getVehicles(with starWarsEntityURLPath: Endpoint, completionHandler completion: @escaping VehiclesCompletionHandler) {
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 29?"))
                    print(Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 29?"))
                    return
                }
                self.allVehiclesJSON = json
                guard let results = self.allVehiclesJSON["results"] as? [[String: Any]] else {
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
                    self.allVehiclesJSON = [:]
                }
                self.allDownloadedVehicles = self.allDownloadedVehicles.sorted(by: {$1.name > $0.name})
                completion(sortedVehicles, nil)
            }
        }
        task.resume()
    }
    
    /*
    func getStarships(with starWarsEntityURLPath: Endpoint, completionHandler completion: @escaping StarshipsCompletionHandler) {
        endpoint = SWAPI.spaceships(page: nil)
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 72?"))
                    print(Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 72?"))
                    return
                }
                self.allStarshipsJSON = json
                guard let results = self.allStarshipsJSON["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(Errors_API_Awakens.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
                let starships: [Starship] = results.flatMap { Starship(json: $0) }
                let sortedStarships: [Starship] = starships.sorted(by: {$1.name > $0.name})
                self.allDownloadedStarships.append(contentsOf: sortedStarships)
                let next = json["next"]
                if next != nil {
                    self.endpoint = SWAPI.spaceships(page: "\(self.pageNumber)")
                    self.getStarships(with: self.endpoint, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    self.endpoint = SWAPI.spaceships(page: nil)
                    print("endpoint has been reset to: \(self.endpoint)")
                    self.pageNumber = 2
                    print("\(self.pageNumber)")
                    self.allStarshipsJSON = [:]
                }
                self.allDownloadedStarships = self.allDownloadedStarships.sorted(by: {$1.name > $0.name})
                completion(sortedStarships, nil)
            }
        }
        task.resume()
    }
    
    
    func getCharacters(with starWarsEntityURLPath: Endpoint, completionHandler completion: @escaping CharactersCompletionHandler) {
        endpoint = SWAPI.people(page: nil)
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 110?"))
                    print(Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 110?"))
                    return
                }
                self.allPeopleJSON = json
                guard let results = self.allPeopleJSON["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(Errors_API_Awakens.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
                let people: [Character] = results.flatMap { Character(json: $0) }
                let sortedPeople: [Character] = people.sorted(by: {$1.name > $0.name})
                self.allDownloadedPeople.append(contentsOf: sortedPeople)
                let next = json["next"]
                if next != nil {
                    self.endpoint = SWAPI.people(page: "\(self.pageNumber)")
                    self.getCharacters(with: self.endpoint, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    self.endpoint = SWAPI.people(page: nil)
                    print("endpoint has been reset to: \(self.endpoint)")
                    self.pageNumber = 2
                    print("\(self.pageNumber)")
                    self.allPeopleJSON = [:]
                }
                self.allDownloadedPeople = self.allDownloadedPeople.sorted(by: {$1.name > $0.name})
                completion(sortedPeople, nil)
            }
        }
        task.resume()
    }
    
    */
    
}



























