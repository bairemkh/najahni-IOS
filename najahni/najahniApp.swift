//
//  najahniApp.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI


@main
struct najahniApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("language") private var language = Language.en
    @Environment(\.scenePhase) var scenePhase
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
                    }
                    .onChange(of: scenePhase) { newPhase in
                        switch (newPhase){
                            
                        case .background:
                            print("background")
                            UNUserNotificationCenter.current().delegate
                            
                        case .inactive:
                            print("inactive")
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
