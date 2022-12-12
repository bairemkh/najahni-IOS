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
    
   

    var body: some Scene {
        WindowGroup {
            //SplashView()
            messageView()
        }
    }
}
