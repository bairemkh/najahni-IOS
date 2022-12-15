//
//  CustomBoxView.swift
//  najahni
//
//  Created by najahni on 19/11/2022.
//

import SwiftUI

struct CustomBoxView: View {
    var nbr : Int
    var body: some View {
        VStack{
            Text("\(nbr)")
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 8.0)
            Text("Courses")
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            //Spacer()
                
        }
            .padding()
                
    }
}

struct CustomBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBoxView(nbr: 0)
    }
}
