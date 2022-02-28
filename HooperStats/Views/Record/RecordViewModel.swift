//
//  RecordViewModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/25/22.
//

import Foundation

class RecordViewModel: ObservableObject {
    @Published var games: [Game] = []
    
    private var saveFileURL: URL? {
        try? FileManager.default.url(
            for: .documentDirectory,
               in: .userDomainMask,
               appropriateFor: nil,
               create: true
        )
            .appendingPathComponent("gameEntries")
            .appendingPathExtension("json")
    }
    
    func createGame(type: GameType, points: Int, assists: Int, rebounds: Int, gameDetails: String, date: Date) {
        let game = Game(type: type, points: points, assists: assists, rebounds: rebounds, gameDetails: gameDetails, date: date)
        games.append(game)
        saveGames()
    }
    
    func update(game: Game, type: GameType, points: Int, assists: Int, rebounds: Int, gameDetails: String, date: Date) {
        game.type = type
        game.points = points
        game.assists = assists
        game.rebounds = rebounds
        game.gameDetails = gameDetails
        game.date = date
        saveGames()
    }
    
    func delete(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        games.remove(at: index)
        saveGames()
    }
    
    private func saveGames() {
        
        guard let url = saveFileURL else { return }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(games)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadGames() {
        guard let url = saveFileURL else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let games =  try decoder.decode([Game].self, from: data)
            self.games = games
        } catch {
            print(error)
        }
    }
}
