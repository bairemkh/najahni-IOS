//
//  googlesigninViewModel.swift
//  najahni
//
//  Created by najahni on 28/11/2022.
//

import Foundation
import GoogleSignIn
import Alamofire
import SwiftyJSON

class GoogleAuth : ObservableObject {
    
    @Published var email: String = ""
    @Published var givenName: String = ""
    @Published var givenLastName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    init(){
        check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let email = user.profile?.email
            let givenName = user.profile?.givenName
            let lastName = user.profile?.familyName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.email = email ?? ""
            self.givenName = givenName ?? ""
            self.givenLastName = lastName ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    func signIn(completed: @escaping (Bool , Int
    ) -> Void){
        
       guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

        let signInConfig = GIDConfiguration.init(clientID: "547830882551-jvkn5318968kupb5lpssk949bptk7ln8.apps.googleusercontent.com")
        GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController,
            callback: { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                self.checkStatus()
                let parmetres : [String : Any] = [
                    "email": self.email,
                    "password": " ",
                    "firstname": self.givenName,
                    "lastname": self.givenLastName,
                    "image": self.profilePicUrl
                ]
                AF.request(GOOGLE_SIGNIN, method: .post, parameters: parmetres, encoding: JSONEncoding.default)
                    .validate(statusCode: 200..<300)
                    .validate(contentType: ["application/json"])
                    .responseJSON{
                        (res) in
                        switch res.result {
                        case .success(let data):
                            let json = JSON(data)
                            let token = json["token"].stringValue
                            let role = json["role"].stringValue
                            UserDefaults.standard.setValue(token, forKey: "token")
                            UserService.profile { _, user in
                                SessionManager.currentUser = user
                            }
                            UserDefaults.standard.setValue(role, forKey: "role")
                            completed(true,200)
                        case .failure(let error):
                            print("request failed")
                            print(res.error?.responseCode)
                            completed(false,res.error?.responseCode ?? 500)
                            
                        }
                    }
            }
        )
    }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
