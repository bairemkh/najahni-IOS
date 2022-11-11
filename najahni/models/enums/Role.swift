//
//  Role.swift
//  najahni
//
//  Created by bairem mohamed on 11/11/2022.
//

import Foundation
enum Role {
    case Trainer,Student
    func toString(role:Role) -> String {
        if(role==Role.Student)
            {
                return "Student"
            }
        else
            {
                return "Trainer"
            }
    }
    }

