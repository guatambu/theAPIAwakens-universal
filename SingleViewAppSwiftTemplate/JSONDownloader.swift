//
//  JSONDownloader.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Kelly Johnson on 12/1/17.
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
    
    func jsonTask(wth request: URLRequest) -> URLSessionDataTask {
        let task = session.dataTask(with: request) {data, request, error in
            
        }
        return task
    }
}


