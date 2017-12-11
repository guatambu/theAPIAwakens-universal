//
//  JSONDownloader.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 12/1/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class JSONDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    
    typealias JSONTaskCompletionHandler = (JSON?, Errors_API_Awakens?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) {data, response, error in
            // Convert to HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed(message: "the network request failed"))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure(message: "there was an error in the JSON data conversion"))
                    }
                } else{
                    completion(nil, .invalidData(message: "the data is invlaid"))
                }
            } else {
                completion(nil, .responseUnsuccessful(message: "response unsuccessful"))
            }
        }
        return task
    }
}


