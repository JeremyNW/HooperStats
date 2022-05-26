//
//  Game.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import Foundation
import UIKit

class Game: Codable {
    var type: GameType
    var points: Int
    var assists: Int
    var rebounds: Int
    var gameDetails: String
    var date: Date
    
    init(type: GameType, points: Int, assists: Int, rebounds: Int, gameDetails: String) {
        self.type = type
        self.points = points
        self.assists = assists
        self.rebounds = rebounds
        self.gameDetails = gameDetails
        self.date = Date()
    }
    
}


enum GameType: String, Codable, CaseIterable {
    case threeVsThree = "3 vs. 3"
    case fiveVsFive = "5 vs. 5"
    var imageName: String {
        switch self {
            
        case .threeVsThree:
            return "person.3"
        case .fiveVsFive:
            return "person"
        }
    }
}


extension Game: Equatable, Hashable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
