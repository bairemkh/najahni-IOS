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
    var body: some Scene {
        WindowGroup {
        SplashView()
                .background(Color("BackgroundColor"))
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
                //.environment(\.locale, .init(identifier: "en"))
                    .accentColor(.primary)
                    .onAppear{
                        print("is dark ==> \(isDarkMode)")
                    }
            
            //messageView(user: UserFix)
        }
    }
}
