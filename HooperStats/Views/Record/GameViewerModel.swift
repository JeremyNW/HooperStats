//
//  GameViewerModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/26/22.
//

import Foundation
import SwiftUI

class GameViewerModel: ObservableObject {
    @Published var type = GameType.threeVsThree
    @Published var points = 0
    @Published var assists = 0
    @Published var rebounds = 0
    @Published var gameDetails = ""
    @Published var date = Date.now
    
    func onAppear(game: Game) {
        type = game.type
        points = game.points
        assists = game.assists
        rebounds = game.rebounds
        gameDetails = game.gameDetails
    }
    
}
