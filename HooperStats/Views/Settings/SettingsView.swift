//
//  SettingsView.swift
//  HooperStats
//
//  Created by Jeremy Warren on 2/24/22.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    
    @AppStorage("isOnboarded") var isOnboarded = false
    @AppStorage("isNotificationsEnabled") var isNotificationsEnabled = false
    @StateObject var model = SettingsModel()
    
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
                   
                        Toggle("Notification", isOn: $isNotificationsEnabled)
                    
                }
                Section("Extras") {
                    NavigationLink(destination: Text("Big thank you to Undraw for the images used in our app! \n" )
                                    .font(.headline)
                                    .padding()
                    ) {
                        Text("Acknowledgements")
                    }
                    NavigationLink(destination: ContactView()) {
                        Text("Contact Us")
                    }
                    NavigationLink(destination: Text("Feedback")) {
                        Text("Feedback")
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
        .onChange(of: isNotificationsEnabled) { isEnabled in
            model.requestNotificationAuthorization()
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
