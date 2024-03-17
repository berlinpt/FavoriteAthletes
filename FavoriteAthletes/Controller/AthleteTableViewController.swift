//
//  ViewController.swift
//  FavoriteAthletes
//
//  Created by Berlin Thomas on 2024-03-15.
//

import UIKit

class AthleteTableViewController: UITableViewController {
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AthleteCell", for: indexPath)
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.league
        return cell
    }
    
    
    @IBSegueAction func addAthlete(_ coder: NSCoder) -> AthleteFormViewController? {
        return AthleteFormViewController(coder: coder)
    }
    
    
    @IBSegueAction func editAthlete(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        let athleteToEdit: Athlete?
        
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
        }
        else {
            athleteToEdit = nil
        }
        return AthleteFormViewController(coder: coder, athlete: athleteToEdit)
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        guard
            let athleteFormViewController = segue.source as? AthleteFormViewController,
            let athlete = athleteFormViewController.athlete
        else {
            return
        }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            athletes[selectedIndexPath.row] = athlete
        }
        else {
            athletes.append(athlete)
        }
    }
    

}

