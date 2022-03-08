//
//  GameCreatorView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/25/22.
//

import SwiftUI

struct GameCreatorView: View {
    @ObservedObject var recordViewModel: RecordViewModel
    @StateObject var viewModel = GameCreatorModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            
                Picker("Game Type", selection: $viewModel.type) {
                    Text("5 vs. 5").tag(GameType.fiveVsFive)
                    Text("3 vs. 3").tag(GameType.threeVsThree)
                
            }
            
            Stepper("Points: \(viewModel.points.formatted())", value: $viewModel.points, in: 0...50, step: 1)
            
            Stepper("Assists: \(viewModel.assists.formatted())", value: $viewModel.assists, in: 0...20, step: 1)
            
            Stepper("Rebounds: \(viewModel.rebounds.formatted())", value: $viewModel.rebounds, in: 0...25, step: 1)
            
            Section("Game Details") {
                TextEditor(text: $viewModel.gameDetails)
                    .border(.secondary)
                
            }
        }
        .navigationBarTitle("Create your Game", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    recordViewModel.createGame(type: viewModel.type, points: Int(viewModel.points), assists: viewModel.assists, rebounds: viewModel.rebounds, gameDetails: viewModel.gameDetails, date: viewModel.date)
                    dismiss()
                }, label: {
                    Text("Save")
                })
            }
        }
    }
}

struct GameCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        GameCreatorView(recordViewModel: RecordViewModel())
    }
}
