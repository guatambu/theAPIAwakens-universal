//
//  VehiclesViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class VehiclesViewController: UIViewController {

    @IBOutlet weak var vehiclesPickerView: UIPickerView!
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
        
        let currentVehicle = Vehicle(id: 1, name: "X-34 landspeeder", make: "SoroSuub Corporation", cost_in_credits: "10550", length: "3.4", vehicle_class: "repulsorcraft", crew: "1")
        let currentVehicleModel = VehicleViewModel(model: currentVehicle)
        
        displayVehicleInformation(using: currentVehicleModel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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







