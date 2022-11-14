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
        @Binding var presentPicker : Bool?
        var body: some View {
                return ZStack {
                    Color.black.opacity(0.4)
                    VStack {
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        presentPicker = false
                                    }
                                }) {
                                    Text("Cancel")
                                }
                                .padding(10)
                                Spacer()
                               
                            }
                            .background(Color("primaryColor"))
                            .foregroundColor(.white)
                            Text("Tap an entry to select it, or type in a new entry.")
                                .font(.caption)
                                .padding(.leading,10)
                            
                            List {
                                ForEach(items, id: \.name) { item in
                                    Button(action: {
                                        if let existingIndex = selected.firstIndex(where: { $0.id == item.id }) {
                                            selected.remove(at: existingIndex)
                                        } else {
                                            selected.insert(item,at: 0)
                                        }
                                        print(selected)
                                    }){
                                        HStack {
                                            Text(item.name)
                                            Spacer()
                                            if(selected.contains(where: { i in
                                                i.id==item.id
                                            })){
                                                Image(systemName: "heart.fill")
                                                 .foregroundColor(Color("primaryColor"))
                                            }
                                            else{
                                                Image(systemName: "heart")
                                                 .foregroundColor(Color("primaryColor"))
                                            }
                                           }
                                     }
                                }
                            }
                            .listStyle(.plain)
                        }
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .frame(maxWidth: 400)
                        .padding(.horizontal,10)
                        .frame(height: frameHeight)
                        .padding(.top, 40)
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
}

struct CustomPicker2View_Previews: PreviewProvider {
    static var sampleData=[ListData(name: "Milk"),ListData(name: "Apples"),ListData(name: "Sugar"),ListData(name: "Eggs"),ListData(name: "Oranges"),ListData(name: "Potatoes"),ListData(name: "Corn")]
    static var selected : [ListData] = []
    static var previews: some View {
        CustomPicker2View(items: sampleData,selected: selected, presentPicker: .constant(true))
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
