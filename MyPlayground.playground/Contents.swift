//: Playground - noun: a place where people can play

import UIKit

class MetricBritishConversion {
    
    // 1 yard = 0.9144 meter
    // 1 meter = 1.09361 yards
    
    func metersToYards(_ meters: Double) -> Double {
        let yards = (round(10 * (meters * 1.09361))/10)
        return yards
    }
    
    func yardsToMeters(_ yards: Double) -> Double {
        
        let meters = (round(10 * (yards * 0.9144))/10)
        return meters
    }
    
}

extension String {
    var doublesOnly: String {
        let doubles = self.replacingOccurrences(of: "[^0-9.]", with: "", options: .regularExpression, range:nil)
        return doubles
    }
}

let metricBritishConversion = MetricBritishConversion()

func convertToMetricUnits(_ meters: String?) {
    let vehicleLengthText: String? = meters
    guard let vehicleLengthValue = vehicleLengthText, let vehicleLength_Double = Double(vehicleLengthValue.doublesOnly) else {
        print("error in yards text")
        return
    }
    print("\(metricBritishConversion.yardsToMeters(vehicleLength_Double))m")
    
}

let length:String? = "30.8m"

let length1:String? = "28.2"

convertToMetricUnits(length)








