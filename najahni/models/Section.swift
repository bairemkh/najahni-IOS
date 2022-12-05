//
//  Section.swift
//  najahni
//
//  Created by najahni on 5/12/2022.
//

import Foundation
struct Section :Identifiable{
    let id, title: String
    let idCourse : String
    init(id: String, title: String, idCourse: String) {
        self.id = id
        self.title = title
        self.idCourse = idCourse
    }
}
