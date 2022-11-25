//
//  CustomSelectionView.swift
//  najahni
//
//  Created by bairem mohamed on 22/11/2022.
//

import SwiftUI

struct CustomSelectionView: View {
    @State var list = Fields.allCases.map { f in
        return ListData(name: f.rawValue)
    }
    @State var itemSelected = -1
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
                            print("\(itemSelected)")
                            itemSelected = list.firstIndex(of: item) ?? -1
                        }
                    }
                }
                .padding(.all)
            }
        }
    }
}

struct CustomSelectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomSelectionView()
    }
}

struct CustomSelectionElement: View {
    @State var element:ListData
    var onSelection : () -> Bool
    var body: some View {
        if #available(iOS 15.0, *) {
            if onSelection() {
                Text(element.name)
                    .font(.system(size: 30))
                    .padding(20.0)
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.blue,lineWidth: 5)
                    )
            }else
            {
                Text(element.name)
                    .padding(20.0)
                    .font(.system(size: 30))
                    .overlay (
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.green,lineWidth: 5)
                    )
            }
            
        } else {
            
        }
        
    }
}
