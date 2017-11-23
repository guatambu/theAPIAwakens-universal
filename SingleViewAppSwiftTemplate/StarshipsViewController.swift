//
//  StarshipsViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

// need to create implementation for the smallest and largest data properties and stub subsequent data

import UIKit

class StarshipsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var starshipsPickerView: UIPickerView!
    var pickerDataSource: [String] = [String]()
    
    @IBOutlet weak var largestStarship: UILabel!
    @IBOutlet weak var smallestStarship: UILabel!
    @IBOutlet weak var starshipMaxCrewNumber: UILabel!
    @IBOutlet weak var starshipLength: UILabel!
    @IBOutlet weak var starshipCost: UILabel!
    @IBOutlet weak var starshipClass: UILabel!
    @IBOutlet weak var starshipMake: UILabel!
    @IBOutlet weak var starshipName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        let currentStarship = Starship(id: 1, name: "Millenium Falcon", make: "Corellian Engineering Corporation", cost_in_credits: "100000", length: "34.37", starship_class: "Light freighter", crew: "4")
        do {
            let currentStarshipModel = try StarshipViewModel(model: currentStarship)
            displayStartshipInfo(using: currentStarshipModel)
        } catch Errors_API_Awakens.stringNotInteger {
            print("invalid entry on 'length' property")
        } catch {
            print("error in API pachkaged JSON")
        }
        */
        
        self.starshipsPickerView.delegate = self
        self.starshipsPickerView.dataSource = self
        pickerDataSource = ["Millenium Falcon", "Coronet", "Imperial Light Cruiser", "Imperial Star Destroyer", "Naboo Royal Starship", "Nebulon-B Frigate", "Republic Attack Cruiser", "Death Star", "Mon Calamari Starship"]
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
        var currentStarship = Starship(id: 1, name: "Millenium Falcon", make: "Corellian Engineering Corporation", cost_in_credits: "100000", length: "34.37", starship_class: "Light freighter", crew: "4")
        
        if pickerDataSource[row] ==  currentStarship.name {
            do {
                var currentStarshipModel = try StarshipViewModel(model: currentStarship)
                displayStartshipInfo(using: currentStarshipModel)
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
    

    func displayStartshipInfo(using starshipViewModel: StarshipViewModel) {
        starshipName.text = starshipViewModel.name
        starshipMake.text = starshipViewModel.make
        starshipClass.text = starshipViewModel.starship_class
        starshipCost.text = starshipViewModel.cost_in_credits
        starshipLength.text = starshipViewModel.length
        starshipMaxCrewNumber.text = starshipViewModel.crew
    }

}
