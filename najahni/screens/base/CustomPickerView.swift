//
//  CustomPickerView.swift
//  najahni
//
//  Created by bairem mohamed on 12/11/2022.
//

import SwiftUI

protocol CustomPicker {
    func saveUpdates(_ newItem: String)
}

struct CustomPickerView: View {
        let label: LabelView
        let options: [Selectable]
        let optionToString: (Selectable) -> String
        var selected: Binding<Set<Selectable>>
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
                            ForEach(0..<items.count) {  index in
                                Button(action: {
                                    items[index].isSelected=true
                                    print(items[index].isSelected)
                                }){
                                    HStack {
                                        Text(items[index].isSelected.description)
                                        Spacer()
                                        if(items[index].isSelected){
                                            Image(systemName: "heart.fill")
                                             .foregroundColor(Color("primaryColor"))
                                             .animation(.easeIn)
                                        }
                                        else{
                                            Image(systemName: "heart")
                                             .foregroundColor(Color("primaryColor"))
                                             .animation(.easeIn)
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


struct CustomPickerView_Previews: PreviewProvider {
    static var sampleData = [ListData(name: "Milk"),ListData(name: "Apples"),ListData(name: "Sugar"),ListData(name: "Eggs"),ListData(name: "Oranges"),ListData(name: "Potatoes"),ListData(name: "Corn")]
        static var previews: some View {
            CustomPickerView(items: sampleData, presentPicker: .constant(true))
        }
}

struct ListData: Identifiable{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
      
}
