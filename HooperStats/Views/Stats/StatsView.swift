//
//  StatsView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI

struct StatsView: View {
    @StateObject var gameModel = RecordViewModel()
    @StateObject var model = StatsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
               Form {
                   VStack(alignment: .center) {
                    TextField("Player Name", text: $model.name)
                        .padding()
                        .multilineTextAlignment(.center)
                    if let image = model.image {
                        Image(uiImage: image)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200.0, height: 200.0)
                            .cornerRadius(.infinity)
                        
                    } else {
                        
                        Image(systemName: "person.crop.circle.fill")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: 200.0, height: 200.0)
                            .foregroundColor(.secondary)
                    }
                    if !gameModel.games.isEmpty {
                        HStack {
                            Text("PPG:").bold()
                            Text("\(model.pointsPerGame(games: gameModel.games), specifier: "%.2f")")
                            
                        }
                        .padding()
                        HStack {
                            Text("APG:").bold()
                            Text("\(model.assistPerGame(games: gameModel.games), specifier: "%.2f")")
                        }
                        .padding()
                        
                        HStack {
                            Text("RPG:").bold()
                            Text("\(model.reboundsPerGame(games: gameModel.games), specifier: "%.2f")")
                        }
                        .padding()
                    }
                }
               }
                .navigationTitle("Stats")
                .onAppear(perform: gameModel.loadGames)
                .onAppear(perform: model.onAppear)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {
                            model.isPresentingAlert = true
                        }, label: {
                            Image(systemName: "photo.on.rectangle")
                        })
                    }
                }
                
                .popover(item: $model.presentedView, content: { view in
                    switch view {
                    case .camera:
                        Camera(image: $model.image)
                    case .photoPicker:
                        PhotoPicker(image: $model.image)
                        
                    }
                })
                .alert("Image Source", isPresented: $model.isPresentingAlert) {
                    Button(action: {
                        model.presentedView = .camera
                    }, label: {
                        Text("Camera")
                    })
                    
                    Button(action: {
                        model.presentedView = .photoPicker
                    }, label: {
                        Text("Gallery")
                    })
                }
            }
            
        }
        
    }
    
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
