//
//  Athlete.swift
//  FavoriteAthletes
//
//  Created by Berlin Thomas on 2024-03-15.
//

import Foundation

struct Athlete: CustomStringConvertible {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) year old and plays for the \(team) in the \(league)"
    }
}
