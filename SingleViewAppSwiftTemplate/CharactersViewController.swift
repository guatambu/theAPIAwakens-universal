//
//  CharactersViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

 // !!! just adding a comment - NEED TO WIRE THIS UP TO MAIN STORYBOARD !!!

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet weak var charactersPickerView: UIPickerView!
    @IBOutlet weak var largestCharacterDisplay: UILabel!
    @IBOutlet weak var smallestCharacterDisplay: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var eyes: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var homePlanet: UILabel!
    @IBOutlet weak var yearBorn: UILabel!
    @IBOutlet weak var characterName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let currentCharacter = Character(id: 1, name: "Luke Skywalker", birth_year: "19BBY", homeworld: "Tatooine", height: "172", eyes: "blue", hair: "blonde")
        let currentCharacterModel = CharacterViewModel(model: currentCharacter)
        
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
