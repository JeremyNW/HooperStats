//
//  MainView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            RecordView()
                .tabItem {
                    Label("Record", systemImage: "pencil")
                }
            StatsView()
                .tabItem {
                Label("Stats", systemImage: "person.circle.fill")
            }
            SettingsView()
                .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
