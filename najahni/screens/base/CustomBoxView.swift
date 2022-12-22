//
//  CustomBoxView.swift
//  najahni
//
//  Created by najahni on 19/11/2022.
//

import SwiftUI

struct CustomBoxView: View {
    var nbr : Int
    var title : String = "Courses"
    var body: some View {
        VStack{
            Text("\(nbr)")
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 8.0)
            Text(LocalizedStringKey(title))
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("Black"))
            //Spacer()
                
        }
            .padding()
                
    }
}

struct CustomBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBoxView(nbr: 0,title: "")
    }
}
