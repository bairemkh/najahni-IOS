//
//  CustomCard2View.swift
//  najahni
//
//  Created by najahni on 22/11/2022.
//

import SwiftUI

struct CustomCard2View: View {
    var body: some View {
        VStack {
                   Image("user")
                       .resizable()
                       .frame(width: 150, height: 150 * (300/210))
                       .cornerRadius(20.0)
                   Text("Luxury Swedian chair").font(.title3).fontWeight(.bold)
                   
                   HStack (spacing: 2) {
                      
                       Spacer()
                       Text("$1299")
                           .font(.title3)
                           .fontWeight(.bold)
                   }
               }
               .frame(width: 250)
               .padding()
               .background(Color.white)
               .cornerRadius(20.0)
               
    }
}

struct CustomCard2View_Previews: PreviewProvider {
    static var previews: some View {
        CustomCard2View()
    }
}
