//
//  PickerViewDataSource.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 12/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class PickerViewDataSource: NSObject, UIPickerViewDataSource {

    var data = [Vehicle]()
    
    override init() {
        super.init()
    }
    
    func update(with vehicles: [Vehicle]) {
        data = vehicles
    }
    
    // MARK: Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    
}








