//
//  CartViewModel.swift
//  najahni
//
//  Created by najahni on 12/12/2022.
//

import Foundation
class CartViewModel: ObservableObject {
    @Published var price  = 0
    @Published var urlString = ""
    func addPayement(completed:@escaping(Bool,String?)->Void){
        CourseService.payementApi(amount: price ?? 0) { isOk,status,url in
            self.urlString = url!
            completed(isOk,url)
            
        }
    }
}
