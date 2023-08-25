//
//  User.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 23/08/23.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var profileImage: MovieImage
    var movies: [MovieImage]
    
    static var samples: [User] = [
        User(firstName: "Chirs",lastName: "Nolan", profileImage: .chrisNolan, movies: [.inception, .interstellar, .dunkirk, .oppenheimer]),
        User(firstName: "Stan",lastName: "Lee", profileImage: .stanLee, movies: [.winterSoldier, .civilWar, .infinityWar, .endgame]),
        User(firstName: "Rowling",lastName: "JK", profileImage: .rowling, movies: [.chamberOfSecrets, .halfBloodPrince, .prisonerOfAzkaben, .orderOfPhoenix])
    ]
}
