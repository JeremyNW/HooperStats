//
//  GameViewer.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/26/22.
//

import SwiftUI

struct GameViewer: View {
    let game: Game
    
    var body: some View {
        VStack(spacing: 35) {
            VStack {
                Text("\(game.type.rawValue)")
                    .font(.largeTitle)
                Text(game.date, style: .date)
                    .font(.headline)
            }
            Spacer()
            VStack(alignment: .leading) {
            Text("Points: \(game.points)")
                .font(.body)
                .padding()
            Text("Assists: \(game.assists)")
                .font(.body)
                .padding()
            Text("Rebounds: \(game.rebounds)")
                    .padding()
            }
            Spacer()
            Text("Game Details")
            Text(game.gameDetails)
                .padding()
                .border(.thinMaterial)
            Spacer()
        }
    }
}

struct GameViewer_Previews: PreviewProvider {
    static var previews: some View {
        GameViewer(game: Game(type: .threeVsThree, points: 10, assists: 5, rebounds: 3, gameDetails: "It was a fun game.", date: Date.now))
    }
}
