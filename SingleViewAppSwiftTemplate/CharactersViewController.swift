//
//  CharactersViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Michael Guatambu Davis on 11/13/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

// need to create implementation for the smallest and largest data properties and stub subsequent data

import UIKit

class CharactersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var charactersPickerView: UIPickerView!
    var pickerData: [String] = [String]()
    
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
        
        self.navigationController?.navigationItem.backBarButtonItem?.title = " "

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
        
        
        self.charactersPickerView.delegate = self
        self.charactersPickerView.dataSource = self
        pickerData = ["Luke Skywalker", "Chewbacca", "Darth Vader", "Han Solo", "Princess Leia", "Lando Kalrisian", "C-3PO", "R2-D2", "Darth Maul"]

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
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
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