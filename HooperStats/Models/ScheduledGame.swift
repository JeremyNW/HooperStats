//
//  ScheduledGame.swift
//  HooperStats
//
//  Created by Jeremy Warren on 4/17/22.
//

import Foundation

struct ScheduledGame: Codable, Hashable {
    var id: String = UUID().uuidString
    let date: Date
    let gameType: GameType
    let prep: String
}
