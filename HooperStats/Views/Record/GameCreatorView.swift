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
    var body: some View {
        VStack {
            HStack{
            Text("Game:")
                Picker("Game Type", selection: $viewModel.type) {
                    Text("5 vs. 5").tag(GameType.fiveVsFive)
                    Text("3 vs. 3").tag(GameType.threeVsThree)
                }
                
            }
            
                Stepper("Points: \(viewModel.points.formatted())", value: $viewModel.points, in: 0...50, step: 1)
                .padding()
      
            Stepper("Assists: \(viewModel.assists.formatted())", value: $viewModel.assists, in: 0...20, step: 1)
                .padding()
            
            Stepper("Rebounds: \(viewModel.rebounds.formatted())", value: $viewModel.rebounds, in: 0...25, step: 1)
                .padding()
          
            HStack {
                Text("Game Details")
                TextField("Game Details", text: $viewModel.gameDetails)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .lineLimit(0)
            }
            .padding()
        }
        .navigationBarTitle("Create your Game", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    recordViewModel.createGame(type: viewModel.type, points: Int(viewModel.points), assists: viewModel.assists, rebounds: viewModel.rebounds, gameDetails: viewModel.gameDetails, date: viewModel.date)
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
