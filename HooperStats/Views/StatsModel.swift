//
//  StatsModel.swift
//  HooperStats
//
//  Created by Zachary Buffington on 2/25/22.
//

import Foundation
import UIKit
import Combine
import SwiftUI

class StatsViewModel: ObservableObject {
    @Published var isPresentingAlert = false
    @Published var presentedView: PresentedView?
    @Published var image: UIImage?
    @AppStorage("name") var name: String = ""
    private var imageSubscription: AnyCancellable?
    private var saveFileURL: URL? {
        try? FileManager.default.url(
            for: .documentDirectory,
               in: .userDomainMask,
               appropriateFor: nil,
               create: true
        )
            .appendingPathComponent("profile")
            .appendingPathExtension("jpeg")
    }
    func onAppear() {
        loadImage()
        autoSaveImage()
    }
    func loadImage() {
        if let saveFileURL = saveFileURL,
        let data = try? Data(contentsOf: saveFileURL),
           let image = UIImage(data: data) {
            self.image = image
        }
    }
    func autoSaveImage() {
        imageSubscription = $image.sink(receiveValue: { [weak self] image in
            if let saveFileURL = self?.saveFileURL,
               let data = self?.image?.jpegData(compressionQuality: 0.8) {
                try? data.write(to: saveFileURL)
            }
        })
    }
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


