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
        Form {
            VStack {
                Label("\(game.type.rawValue)", systemImage: game.type.imageName)
                    .tint(.primary)
                    .font(.headline)
                
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Points:")
                        .bold()
                    Text("\(game.points)")
                }
                .padding()
                HStack {
                    Text("Assists:")
                        .bold()
                    Text("\(game.assists)")
                }
                .padding()
                HStack {
                    Text("Rebounds:")
                        .bold()
                    Text("\(game.rebounds)")
                }
                .padding()
            }
            VStack {
                Text("Game Details:")
                    .padding()
                Text(game.gameDetails)
                    .padding()
            }
        }
        .navigationTitle(Text(game.date, style: .date))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct GameViewer_Previews: PreviewProvider {
    static var previews: some View {
        GameViewer(game: Game(type: .threeVsThree, points: 10, assists: 5, rebounds: 3, gameDetails: "It was a fun game."))
    }
}
