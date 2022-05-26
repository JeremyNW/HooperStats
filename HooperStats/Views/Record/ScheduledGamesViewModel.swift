//
//  ScheduledGamesViewModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 4/17/22.
//

import Foundation
import SwiftUI

class ScheduledGamesViewModel: ObservableObject {
    @Published var scheduledGames: [ScheduledGame] = []
    @Published var date: Date = Date.now
    @Published var gameType: GameType = .threeVsThree
    @Published var prep = ""
    @Published var isPresentingGameScheduler = false
    
    private var saveFileURL: URL? {
        try? FileManager.default.url(
            for: .documentDirectory,
               in: .userDomainMask,
               appropriateFor: nil,
               create: true
        )
            .appendingPathComponent("scheduledGames")
            .appendingPathExtension("json")
    }
    
    func create() {
        let scheduledGame = ScheduledGame(date: date, gameType: gameType, prep: prep)
        scheduledGames.append(scheduledGame)
        saveGames()
    }
    
    func saveGames() {
        
        guard let url = saveFileURL else { return }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(scheduledGames)
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
            let scheduledGames = try decoder.decode([ScheduledGame].self, from: data)
            self.scheduledGames = scheduledGames
        } catch {
            print(error)
        }
    }
    
    func delete(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        scheduledGames.remove(at: index)
        saveGames()
    }
}
