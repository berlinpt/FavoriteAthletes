//
//  AthleteFormViewController.swift
//  FavoriteAthletes
//
//  Created by Berlin Thomas on 2024-03-15.
//

import UIKit

class AthleteFormViewController: UIViewController {

    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
    }
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func saveAthlete(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let ageString = ageTextField.text,
              let age = Int(ageString),
              let league = leagueTextField.text,
              let team = teamTextField.text
        else { return }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "segueForm", sender: self)
                
    }
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
        else {
            return
        }
    }
    
}
