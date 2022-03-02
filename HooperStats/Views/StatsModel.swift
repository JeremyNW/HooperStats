//
//  StatsModel.swift
//  HooperStats
//
//  Created by Zachary Buffington on 2/25/22.
//

import Foundation
import UIKit


class StatsViewModel: ObservableObject {
    @Published var isPresentingAlert = false
    @Published var presentedView: PresentedView?
    @Published var image: UIImage?
    enum PresentedView: String, Identifiable {
        case camera
        case photoPicker
        var id: String {
            rawValue
        }
    }
    func pointsPerGame(games: [Game]) -> Double {
        Double(games.reduce(0, { total, game in
            total + game.points
        })) /
        Double(games.count)
    }
    func assistPerGame(games: [Game]) -> Double {
        Double(games.reduce(0, { total, game in
            total + game.assists
        })) /
        Double(games.count)
    }
    func reboundsPerGame(games: [Game]) -> Double {
        Double(games.reduce(0, { total, game in
            total + game.rebounds
        })) /
        Double(games.count)
    }
}


