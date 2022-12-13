//
//  ListContactsView.swift
//  najahni
//
//  Created by bairem mohamed on 13/12/2022.
//

import SwiftUI

struct ListContactsView: View {
    var body: some View {
        ScrollView {
            VStack{
                
            }
        }
    }
}

struct ListContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ListContactsView()
    }
}

struct ContactCard: View {
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "arrowshape.backward.fill")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .foregroundColor(Color("primaryColor"))
                Spacer()
                Image("user")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70.0, height: 70.0)
                Text("")
                    .font(.title)
                    .fontWeight(.black)
                    .padding(.horizontal)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding([.leading, .bottom, .trailing])
        }
    }
}
