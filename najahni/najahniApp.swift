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

    var body: some Scene {
        WindowGroup {
        SplashView()
                .background(Color("BackgroundColor"))
                .environment(\.colorScheme, .dark)
            
            //messageView(user: UserFix)
        }
    }
}
