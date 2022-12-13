//
//  SectionViewModel.swift
//  najahni
//
//  Created by bairem mohamed on 6/12/2022.
//

import Foundation
class SectionViewModel : ObservableObject{
    @Published var showPopup = false
    @Published var idcourse = ""
    @Published var showField = false
    @Published var nameNewSection = ""
    @Published var selectedSection:Section = Section(id: "dfdfdf", title: "Section", idCourse: "0")
    @Published var indexDelete:IndexSet = IndexSet()
    @Published var showingAlert = false
    func addSection(completed:@escaping(Bool)->Void){
        SectionService.addSection(section: Section(title: nameNewSection, idCourse: idcourse)) { isOk in
            completed(isOk)
        }
    }
}
