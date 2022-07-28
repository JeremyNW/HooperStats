//
//  ScheduledGamesViewModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 4/17/22.
//

import Foundation
import SwiftUI
import UserNotifications

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
        
        let alert = UNMutableNotificationContent()
        alert.title = "You have a game!"
        alert.subtitle = "It's a \(scheduledGame.gameType.rawValue), so bring your best!"
        alert.sound = UNNotificationSound.default
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: scheduledGame.date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: scheduledGame.id, content: alert, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
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
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [scheduledGames[index].id])
        scheduledGames.remove(at: index)
        saveGames()
    }
}
