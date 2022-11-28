//
//  ProfileTrainerViewModel.swift
//  najahni
//
//  Created by najahni on 28/11/2022.
//

import Foundation

class ProfileTrainerViewModel : ObservableObject {
    func getOwnerCourse (completed: @escaping (Bool,User?)-> Void) {
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(PROFILE_URL,
                   method: .get,
                headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                let user = self.makeItem(jsonItem: json["data"])
                print(user)
                completed(true,user)
            case .failure(let error):
                print(error)
                completed(false,nil)
                
            }
        }
    }

}
