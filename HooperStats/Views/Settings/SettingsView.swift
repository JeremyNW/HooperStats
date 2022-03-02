//
//  SettingsView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isOnboarded") var isOnboarded = false
    var body: some View {
        NavigationView {
            List {
                Section("Preferences") {
                    Button(action: {
                        isOnboarded = false
                    }, label: {
                       Text("Tutorial")
                            .tint(.primary)
                    })
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
