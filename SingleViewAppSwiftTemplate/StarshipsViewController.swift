//
//  StarshipsViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

// !!! just adding a comment - NEED TO WIRE THIS UP TO MAIN STORYBOARD !!!

import UIKit

class StarshipsViewController: UIViewController {

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
