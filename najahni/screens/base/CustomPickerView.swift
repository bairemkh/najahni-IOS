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
    var items: [String]
        @State private var filteredItems: [String] = []
        @State private var filterString: String = ""
        @State private var frameHeight: CGFloat = 400
        @State private var inFocus: Bool?
        @Binding var pickerField: String
        @Binding var presentPicker: Bool
        var saveUpdates: ((String) -> Void)?
    var body: some View {
            let filterBinding = Binding<String> (
                get: { filterString },
                set: {
                    filterString = $0
                    if filterString != "" {
                        filteredItems = items.filter{$0.lowercased().contains(filterString.lowercased())}
                    } else {
                        filteredItems = items
                    }
                    setHeight()
                }
            )
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
                            if let saveUpdates = saveUpdates {
                                Button(action: {
                                    if !items.contains(filterString) {
                                        saveUpdates(filterString)
                                    }
                                    pickerField = filterString
                                    withAnimation {
                                        presentPicker = false
                                    }
                                }) {
                                    Image(systemName: "plus.circle")
                                        .frame(width: 44, height: 44)
                                }
                                .disabled(filterString.isEmpty)
                            }
                        }
                        .background(Color("primaryColor"))
                        .foregroundColor(.white)
                        Text("Tap an entry to select it, or type in a new entry.")
                            .font(.caption)
                            .padding(.leading,10)
                            TextField("Filter by entering text", text: filterBinding)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        
                        List {
                            ForEach(filteredItems, id: \.self) { item in
                                Button(action: {
                                    pickerField = item
                                    withAnimation {
                                        presentPicker = false
                                    }
                                }) {
                                    Text(item)
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
        
        fileprivate func setHeight() {
            withAnimation {
                if filteredItems.count > 5 {
                    frameHeight = 400
                } else if filteredItems.count == 0 {
                    frameHeight = 130
                } else {
                    frameHeight = CGFloat(filteredItems.count * 45 + 130)
                }
            }
        }
        
}


struct CustomPickerView_Previews: PreviewProvider {
    static let sampleData = ["Milk", "Apples", "Sugar", "Eggs", "Oranges", "Potatoes", "Corn", "Bread"].sorted()
        static var previews: some View {
            CustomPickerView(items: sampleData, pickerField: .constant(""), presentPicker: .constant(true))
        }
}

struct Ingredient{
        var id = UUID()
        var name: String
        var isSelected: Bool = false
}
