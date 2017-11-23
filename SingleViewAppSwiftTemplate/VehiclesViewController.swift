//
//  VehiclesViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


// need to create implementation for the smallest and largest data properties and stub subsequent data

import UIKit

class VehiclesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var vehiclesPickerView: UIPickerView!
    var pickerDataSource: [String] = [String]()
    
    @IBOutlet weak var largestVehicle: UILabel!
    @IBOutlet weak var smallestVehicle: UILabel!
    @IBOutlet weak var vehicleMaxCrewNumber: UILabel!
    @IBOutlet weak var vehicleClass: UILabel!
    @IBOutlet weak var vehicleLength: UILabel!
    @IBOutlet weak var vehicleCost: UILabel!
    @IBOutlet weak var vehicleMake: UILabel!
    @IBOutlet weak var vehicleName: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*
        let currentVehicle = Vehicle(id: 1, name: "X-34 landspeeder", make: "SoroSuub Corporation", cost_in_credits: "10550", length: "3.4", vehicle_class: "repulsorcraft", crew: "1")
        do {
            let currentVehicleModel = try VehicleViewModel(model: currentVehicle)
            displayVehicleInformation(using: currentVehicleModel)
        } catch Errors_API_Awakens.stringNotInteger {
            print("invalid entry on 'length' property")
        } catch {
            print("error in API pachkaged JSON")
        }
        */
        
        self.vehiclesPickerView.delegate = self
        self.vehiclesPickerView.dataSource = self
        pickerDataSource = ["AT-AT Walker", "H-Type Nubian Yacht", "Jumspeeder", "Podracer", "Snow Speeder", "Sith Speeder", "Speeder Bike", "X-34 Landspeeder", ]
 
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of picker columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        var currentVehicle = Vehicle(id: 1, name: "X-34 Landspeeder", make: "SoroSuub Corporation", cost_in_credits: "10550", length: "3.4", vehicle_class: "repulsorcraft", crew: "1")
        
        if pickerDataSource[row] ==  currentVehicle.name {
            do {
                var currentVehicleModel = try VehicleViewModel(model: currentVehicle)
                displayVehicleInformation(using: currentVehicleModel)
                print(pickerDataSource[row])
            } catch Errors_API_Awakens.stringNotInteger {
                print("invalid entry on 'length' property")
            } catch {
                print("error in API packaged JSON")
            }
        } else {
            print(pickerDataSource[row])
        }
    }
    
    
    func displayVehicleInformation(using vehicleViewModel: VehicleViewModel) {
        vehicleName.text = vehicleViewModel.name
        vehicleMake.text = vehicleViewModel.make
        vehicleCost.text = vehicleViewModel.cost_in_credits
        vehicleLength.text = vehicleViewModel.length
        vehicleClass.text = vehicleViewModel.vehicle_class
        vehicleMaxCrewNumber.text = vehicleViewModel.crew
        
    }

}







