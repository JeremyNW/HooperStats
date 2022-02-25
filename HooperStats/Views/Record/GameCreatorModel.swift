//
//  GameCreatorModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/25/22.
//

import Foundation

class GameCreatorModel: ObservableObject {
    @Published var type: GameType = .threeVsThree
    @Published var points = 0.0
    @Published var assists = 0
    @Published var rebounds = 0
    @Published var gameDetails = ""
    @Published var date = Date.now
    
    func onAppear(game: Game) {
        type = game.type
        points = Double(game.points)
        assists = game.assists
        rebounds = game.rebounds
        gameDetails = game.gameDetails
        date = game.date
    }
    
}
