//
//  Image.swift
//  TotalityCorpiOSAssignment
//
//  Created by KAARTHIKEYA K on 23/08/23.
//

import Foundation
import SwiftUI

extension Image {
    init(movieImage: MovieImage) {
        self.init(movieImage.rawValue)
    }
}

extension UIImage {
    convenience init?(movieImage: MovieImage) {
        self.init(named: movieImage.rawValue)
    }
}


enum MovieImage: String {
    case chamberOfSecrets = "Chamber of Secrets"
    case halfBloodPrince = "Half Blood Prince"
    case prisonerOfAzkaben = "Prisoner of Azkaben"
    case orderOfPhoenix = "Order of Phoenix"
    case civilWar = "Civil War"
    case infinityWar = "Infinity War"
    case endgame = "Endgame"
    case winterSoldier = "Winter Soldier"
    case inception = "Inception"
    case interstellar = "Interstellar"
    case dunkirk = "Dunkirk"
    case oppenheimer = "Oppenheimer"
    case chrisNolan = "Chris Nolan"
    case stanLee = "Stan Lee"
    case rowling = "JK Rowling"
}
