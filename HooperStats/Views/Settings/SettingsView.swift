//
//  SettingsView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Preferences") {
                    NavigationLink(destination: Text("Todo")) {
                        Text("Tutorial - Onboarding")
                    }
                    HStack {
                        Text("Notifications")
                       // ADD TOGGLE
                    }
                }
                Section("Extras") {
                    NavigationLink(destination: Text("")) {
                        Text("Acknowledgements")
                    }
                    NavigationLink(destination: Text("")) {
                        Text("Contact us")
                    }
                    NavigationLink(destination: Text("Feedback")) {
                        Text("Feedback")
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
