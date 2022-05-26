//
//  Match.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/29/22.
//

import Foundation

class Match: Codable {
    var date: Date
    var name: String?
    var gameType: GameType
    
    init(date: Date, name: String?, gameType: GameType) {
        self.date = date
        self.name = name
        self.gameType = gameType
    }
}
