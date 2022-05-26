//
//  MatchView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/29/22.
//

import SwiftUI

struct ScheduledGames: View {
    @StateObject var viewModel = ScheduledGamesViewModel()
    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.scheduledGames, id: \.self) { game in
                    Text(game.date.formatted())
                }
                .onDelete(perform: viewModel.delete(indexSet:))
            }
            .navigationTitle("Schedule")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.isPresentingGameScheduler = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
        
        .onAppear(perform: viewModel.loadGames)
        .popover(isPresented: $viewModel.isPresentingGameScheduler) {
                Form {
                    Text("Select Time and Date")
                    DatePicker("", selection: $viewModel.date)
                        .padding()
                    Button {
                        viewModel.create()
                        viewModel.isPresentingGameScheduler = false
                    } label: {
                        Text("Save")
                    }
                    
                    Picker("Game Type", selection: $viewModel.gameType) {
                        ForEach(GameType.allCases, id: \.rawValue) { type in
                            Label(type.rawValue, systemImage: type.imageName)
                                .tag(type)
                        }
                    }
                }
                .padding()
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledGames()
    }
}
