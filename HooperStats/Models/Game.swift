//
//  GameModle.swift
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
    
    init(type: GameType, points: Int, assists: Int, rebounds: Int, gameDetails: String, date: Date) {
        self.type = type
        self.points = points
        self.assists = assists
        self.rebounds = rebounds
        self.gameDetails = gameDetails
        self.date = Date()
    }
    
}


enum GameType: String, Codable {
    case threeVsThree
    case fiveVsFive
}
