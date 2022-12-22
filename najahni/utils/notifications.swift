//
//  notifications.swift
//  najahni
//
//  Created by bairem mohamed on 22/12/2022.
//

import Foundation
import UserNotifications

class NotificationHandler {
    
     static func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    static func sendNotification(title: String, body: String) {
   
        // Customise the content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        // Create the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }
}
