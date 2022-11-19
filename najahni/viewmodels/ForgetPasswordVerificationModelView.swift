//
//  ForgetPasswordVerificationModelView.swift
//  najahni
//
//  Created by bairem mohamed on 19/11/2022.
//

import Foundation
class TextBindingManager: ObservableObject {
    @Published var digit1 = "" {
        didSet {
            if digit1.count > 1 && oldValue.count <= 1 {
                digit1 = oldValue
            }
        }
    }
    @Published var digit2 = "" {
        didSet {
            if digit2.count > 1 && oldValue.count <= 1 {
                digit2 = oldValue
            }
        }
    }
    @Published var digit3 = "" {
        didSet {
            if digit3.count > 1 && oldValue.count <= 1 {
                digit3 = oldValue
            }
        }
    }
    @Published var digit4 = "" {
        didSet {
            if digit4.count > 1 && oldValue.count <= 1 {
                digit4 = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 1){
        characterLimit = limit
    }
    func getDigits() -> String {
        return "\(self.digit1)\(self.digit2)\(self.digit3)\(self.digit4)"
    }
}
