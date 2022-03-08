//
//  SettingsModel.swift
//  HooperStats
//
//  Created by Jeremy Warren on 3/5/22.
//

import Foundation
import UserNotifications


class SettingsModel: ObservableObject {
    
    func requestNotificationAuthorization() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.scheduleNotification()
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    func scheduleNotification() {
        
        var dateComponents = DateComponents()
        dateComponents.weekday = 7
        dateComponents.hour = 18
        
        let content = UNMutableNotificationContent()
        content.title = "Played any games recently?"
        content.subtitle = "Don't forget to record your stats!"
        content.sound = UNNotificationSound.default
        
        // show this notification five seconds from now
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
        
    }
    
    
}
