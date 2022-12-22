//
//  najahniApp.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI
import SocketIO


@main
struct najahniApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared
    let manager = SocketManager(socketURL: URL(string: URL_BASE_APP)!,config: [.log(false),.reconnects(true)])
    @Environment(\.colorScheme) var colorScheme
    var socket :SocketIOClient
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("language") private var language = Language.en
    @Environment(\.scenePhase) var scenePhase
    var notif = NotificationHandler()
    init(){
        notif.askPermission()
        socket = manager.defaultSocket
        socket.connect()
        
    }
    var body: some Scene {
        WindowGroup {
        SplashView()
                .background(Color("BackgroundColor"))
                .environment(\.colorScheme, isDarkMode ? .dark : .light)

                .environment(\.locale,.init(identifier: language.rawValue))
                    .accentColor(.primary)
                    .onAppear{
                        print("is dark ==> \(isDarkMode)")
                        SessionManager.initLists()
                        print(socket.status)
                        socket.on(clientEvent: .connect) { [self]data, ack in
                            print("ena  connected")
                            socket.on("receive") { data, ack in
                                print("hello")
                                notif.sendNotification(title: "notif", body: "\(data)")
                            }
                        }
                    }
                    .onChange(of: scenePhase) { newPhase in
                        switch (newPhase){
                            
                        case .background:
                            print("background")
                            notif.sendNotification(title: "Background", body: "background")
                            print("bg")
                        case .inactive:
                            print("inactive")
                            notif.sendNotification(title: "inactive", body: "inactive")
                        case .active:
                            print("active")
                        @unknown default:
                            print("unknown")
                        }
                    }
            
            //messageView(user: UserFix)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Here we actually handle the notification
        print("Notification received with identifier \(notification.request.identifier)")
        // So we call the completionHandler telling that the notification should display a banner and play the notification sound - this will happen while the app is in foreground
        completionHandler([.banner, .sound])
    }
}
