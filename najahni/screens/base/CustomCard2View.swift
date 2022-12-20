//
//  CustomCard2View.swift
//  najahni
//
//  Created by najahni on 22/11/2022.
//

import SwiftUI

struct CustomCard2View: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
                   Image("user")
                       .resizable()
                       .frame(width: 200,height: 200)
                       .scaledToFit()
                       .aspectRatio(contentMode: .fill)
                       
            Text("text")
                .padding(.horizontal)
            Text("test")
                .padding([.leading, .bottom, .trailing])

               }

               .background(Color.white)
               .clipShape(RoundedRectangle(cornerRadius: 24.0))
               .shadow(radius: 2)
               
    }
}

struct CustomCard2View_Previews: PreviewProvider {
    static var previews: some View {
        CustomCard2View()
    }
}
