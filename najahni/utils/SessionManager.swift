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
    static func login(token:String){
        UserDefaults.standard.setValue(token, forKey: "token")
        userState = .LoggedIn
    }
    static func logOut() {
        UserDefaults.standard.removeObject(forKey: "token")
        userState = .NotLogged
    }
    static func isLoggedIn() -> Bool{
        return SessionManager.token != nil
    }
    static var currentUser : User? = nil
    static func initLists(){
        let wishList:[String] = []
        let cart:[String] = []
        UserDefaults.standard.set(wishList, forKey: WISHLIST)
        UserDefaults.standard.set(cart, forKey: CART)
    }
    static func getWishlist() -> [String] {
        return UserDefaults.standard.object(forKey: WISHLIST) as! [String]
    }
}
