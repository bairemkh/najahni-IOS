//
//  SessionManager.swift
//  najahni
//
//  Created by bairem mohamed on 21/11/2022.
//

import Foundation

final class SessionManager: ObservableObject {
    enum UserState{
        case LoggedIn
        case NotLogged
    }
    static var userState : UserState = .NotLogged
    static let token = UserDefaults.standard.string(forKey: "token")
    static func logOut() {
        UserDefaults.standard.removeObject(forKey: "token")
        userState = .NotLogged
    }
    static func isLoggedIn() -> Bool{
        return SessionManager.token != nil
        
    }
}
