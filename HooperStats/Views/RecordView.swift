//
//  ContentView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/22/22.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationBarTitle("Record A Game", displayMode: .inline)
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: Text("GameEntry")) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
