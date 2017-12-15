//: Playground - noun: a place where people can play

import UIKit
import Foundation


let dict1: [String: Any?] = [
                                "length": 36.8,
                                "pilots": (""),
                                "crew": 46,
                                "name": "Sand Crawler",
                            ]

let dict2: [String: Any?] = [
                                "length": 25.0,
                                "pilots": (""),
                                "crew": 46,
                                "name": "Sand Crawler",
                            ]

let dict3: [String: Any?] = [
                                "length": 14.0,
                                "pilots": (""),
                                "crew": 46,
                                "name": "Sand Crawler",
                            ]

let dict4: [String: Any?] = [
                                "length": nil,
                                "pilots": (""),
                                "crew": 46,
                                "name": "Sand Crawler",
                            ]


// loop through array of nested dictionaries

// in outermost dictionary, check to see if a specific property is not nil

// if not nil, the value of the checked property becomes the new endpoint

// & a new network call is made repeating the entire process

// if nil, the process stops





extension String {
    func addingPerCentEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

func encodeParametersInURL(_ parameters: [String: Any]) -> String{
    var components = [(String, String)]()
    let sortedKeys = parameters.keys.sorted(by: { $0 < $1 })
    
    for key in sortedKeys {
        let value = parameters[key]!
        let queryComponents = queryComponentsWith(key: key, value: value)
        components.append(contentsOf: queryComponents)
    }
    
    let encodedComponents = components.map { "\($0)=\($1)" }
    
    return encodedComponents.joined(separator: "&")
}

func queryComponentsWith(key: String, value: Any) -> [(String, String)] {
    var components = [(String, String)]()
    
    if let dictionary = value as? [String: Any] {
        for (nestedKey, value) in dictionary {
            let nestedComponents = queryComponentsWith(key: "\(key)[\(nestedKey)]", value: value)
            components.append(contentsOf: nestedComponents)
        }
    } else if let array = value as? [Any] {
        for value in array {
            let nestedComponents = queryComponentsWith(key: "\(key)[]", value: value)
            components.append(contentsOf: nestedComponents)
        }
    } else {
        let encodedKey = key.addingPerCentEncoding()
        let encodedValue = "\(value)".addingPerCentEncoding()
        let component = (encodedKey, encodedValue)
        components.append(component)
    }
    
    return components
    
}












