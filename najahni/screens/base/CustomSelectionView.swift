//
//  CustomSelectionView.swift
//  najahni
//
//  Created by bairem mohamed on 22/11/2022.
//

import SwiftUI

struct CustomSelectionView: View {
    @Binding var list : [ListData]
    @State var itemSelected : Int = 0
    @State var onSelect : (Int) -> Void
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            ScrollViewReader { scroll in
                HStack(spacing: 20){
                    ForEach(list) { item in
                        CustomSelectionElement(element: item){
                            if list.index(of: item)  == itemSelected
                            {
                                return true
                            }
                            return false
                        }.onTapGesture {
                            itemSelected = list.firstIndex(of: item) ?? -1
                            onSelect(itemSelected)
                        }
                    }
                }
                .padding(.all)
            }
        }
    }
}

struct CustomSelectionView_Previews: PreviewProvider {
    @State static var selectedFilter = 0
    @State static var selectionArray : [ListData] = Fields.allCases.map { f in
        return ListData(name: f.rawValue)
    }
    static var previews: some View {
        CustomSelectionView(list: $selectionArray,itemSelected: selectedFilter, onSelect: {_ in
            print("ok")
        })
    }
}

struct CustomSelectionElement: View {
    @State var element:ListData
    var onSelection : () -> Bool
    var body: some View {
        if #available(iOS 15.0, *) {
            if onSelection() {
                Text(element.name)
                    .font(.system(size: 20))
                    .padding(10.0)
                    .foregroundColor(.white)
                    .background(Color("secondaryColor"))
                    .overlay (
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("secondaryColor"),lineWidth: 2)
                    )
                    .cornerRadius(40)
            }else
            {
                Text(element.name)
                    .foregroundColor(Color("secondaryColor"))
                    .padding(10.0)
                    .font(.system(size: 20))
                    .overlay (
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("secondaryColor"),lineWidth: 2)
                    )
            }
            
        } else {
            
        }
        
    }
}
