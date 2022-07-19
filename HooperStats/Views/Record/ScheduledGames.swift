//
//  MatchView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/29/22.
//

import SwiftUI
import UIKit

struct ScheduledGames: View {
    @StateObject var viewModel = ScheduledGamesViewModel()
    var body: some View {
        NavigationView {
            if viewModel.scheduledGames.isEmpty {
                ZStack{
                    VStack {
               DunkingLottie()
                    .frame(width: 300, height: 350, alignment: .center)
                   
                Text("Once you leave the ground, you fly. Some people fly longer than others.")
                        .italic()
                        .padding()
                Text("- Michael Jordan")
                    }
                    
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
            } else {
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
        }
        
        .onAppear(perform: viewModel.loadGames)
        .popover(isPresented: $viewModel.isPresentingGameScheduler) {
                Form {
                    Text("Select Time and Date")
                        .padding()
                    DatePicker("", selection: $viewModel.date)
                        .padding()
                        .datePickerStyle(.compact)
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
                    .pickerStyle(.segmented)
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
