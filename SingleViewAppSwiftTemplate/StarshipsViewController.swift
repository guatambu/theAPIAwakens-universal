//
//  StarshipsViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class StarshipsViewController: UIViewController {

    @IBOutlet weak var starshipsPickerView: UIPickerView!
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
        
        let currentStarship = Starship(id: 1, name: "Millenium Falcon", make: "Corellian Engineering Corporation", cost_in_credits: "100000", length: "34.37", starship_class: "Light freighter", crew: "4")
        let currentStarshipModel = StarshipViewModel(model: currentStarship)
        
        displayStartshipInfo(using: currentStarshipModel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
