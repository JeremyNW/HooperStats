//
//  StatsView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI

struct StatsView: View {
    @StateObject var model = StatsViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Text("James Smith")
                    .padding()
                VStack(alignment: .leading) {
                    if let image = model.image {
                        Image(uiImage: image)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fill)
                            .padding()
                            .frame(width: 200.0, height: 200.0)
                            .cornerRadius(100)
                        
                    } else {
                        
                    Image(systemName: "person.circle")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(width: 200.0, height: 200.0)
                    }
                    Text("PPG:")
                        .padding()
                    Text("APG:")
                        .padding()
                    Text("RPG:")
                        .padding()
                }
            }
            .navigationTitle("Stats")
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

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
