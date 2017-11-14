//
//  VehiclesViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

// !!! just adding a comment - NEED TO WIRE THIS UP TO MAIN STORYBOARD !!!

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
