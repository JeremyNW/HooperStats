//
//  ContentView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/22/22.
//

import SwiftUI



struct RecordView: View {
    @StateObject var model = RecordViewModel()
    var game: Game?
    
    var body: some View {
        NavigationView {
            List {
                
                if !model.games.isEmpty {
                ForEach(model.games, id: \.self) { game in
                    NavigationLink(destination: GameViewer(game: game)) {
                        VStack(alignment: .leading) {
                            if let game = game {
                                Text(game.date, style: .date)
                                    .font(.headline)
                                    .padding(1)
                                Text("Game Type: \(game.type.rawValue)")
                                    .font(.body)
                                    .padding(1)
                                Text("Points: \(game.points)")
                                    .font(.body)
                                    .padding()
                            
                            }
                        }
                    }
                }
                .onDelete(perform: model.delete(indexSet:))
                } else {
                    Text("Games you record will be displayed here!")
                        .foregroundColor(.secondary)
                        .padding()
                        .font(.headline)
                }
            }
            .navigationBarTitle("Record A Game", displayMode: .inline)
            .onAppear(perform: model.loadGames)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: GameCreatorView(recordViewModel: model)) {
                        Image(systemName: "plus")
                    }
                }
            }
            }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
