//
//  CharactersViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

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
        do {
            let currentCharacterModel = try CharacterViewModel(model: currentCharacter)
            displayCharacterInfo(using: currentCharacterModel)
            
        } catch Errors_API_Awakens.stringNotInteger {
            print("invalid entry on 'height' property")
        } catch {
            print("error in API pachkaged JSON")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayCharacterInfo(using characterViewModel: CharacterViewModel) {
        characterName.text = characterViewModel.name
        yearBorn.text = characterViewModel.birth_year
        homePlanet.text = characterViewModel.homeworld
        height.text = characterViewModel.height
        eyes.text = characterViewModel.eyes
        hair.text = characterViewModel.hair
        
    }

   

}
