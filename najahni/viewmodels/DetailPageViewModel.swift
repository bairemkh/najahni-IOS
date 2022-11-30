//
//  DetailPageViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 22/11/2022.
//

import Foundation
import Alamofire
import SwiftyJSON


class DetailPageViewModel : ObservableObject
{
    @Published var title = "Title"
    @Published var Description = ""
    @Published var free = "free"
    @Published var isLiked = false
    
    func enrollNow(id: String){
        let token = UserDefaults.standard.string(forKey: "token")
        let headers : HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(ENROLL_NOW + id,
                   method: .post,
        headers: headers)
        .responseJSON{
            (res) in
            switch res.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
                //completed(true,user)
            case .failure(let error):
                print(error)
                //completed(false,nil)
                
            }
        }
    }
}
