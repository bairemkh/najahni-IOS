//
//  najahniApp.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI
import Firebase

@main
struct najahniApp: App {
    let persistenceController = PersistenceController.shared
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
