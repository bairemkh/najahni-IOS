//
//  CustomPicker2View.swift
//  najahni
//
//  Created by bairem mohamed on 14/11/2022.
//

import SwiftUI

struct CustomPicker2View: View {
    @State var items: [ListData]
    @State var selected: [ListData]
    @State private var frameHeight: CGFloat = 400
    @State private var inFocus: Bool?
        var body: some View {
                 VStack{
                            
                            Text("Select one or many fields that you're intrested in")
                                .font(.caption)
                                .padding([.top, .leading],10)
                            
                            List {
                                ForEach(items, id: \.name) { item in
                                    Button(action: {
                                        if let existingIndex = selected.firstIndex(where: { $0.id == item.id }) {
                                            selected.remove(at: existingIndex)
                                        } else {
                                            selected.insert(item,at: 0)
                                        }
                                    }){
                                        HStack {
                                            Text(item.name)
                                            Spacer()
                                            if let existingIndex = selected.firstIndex(where: { $0.id == item.id }) {
                                                Image(systemName: "heart.fill")
                                                 .foregroundColor(Color("primaryColor"))
                                            } else {
                                                Image(systemName: "heart")
                                                 .foregroundColor(Color("primaryColor"))
                                            }

                                            /*if(selected.contains(where: { i in
                                                i.id==item.id
                                            })){
                                                Image(systemName: "heart.fill")
                                                 .foregroundColor(Color("primaryColor"))
                                            }
                                            else{
                                                Image(systemName: "heart")
                                                 .foregroundColor(Color("primaryColor"))
                                            }*/
                                           }
                                     }
                                }
                            }
                            .listStyle(.plain)
                        }
                        .cornerRadius(10)
                        .frame(maxWidth: 400)
            
                                               
                    
                
            }
}

struct CustomPicker2View_Previews: PreviewProvider {
    static var sampleData=[ListData(name: "Milk"),ListData(name: "Apples"),ListData(name: "Sugar"),ListData(name: "Eggs"),ListData(name: "Oranges"),ListData(name: "Potatoes"),ListData(name: "Corn")]
    static var selected : [ListData] = []
    static var previews: some View {
        CustomPicker2View(items: sampleData,selected: selected)
    }
}

struct ListData: Identifiable{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
    
    func select() -> Bool {
        return !self.isSelected
    }
}
