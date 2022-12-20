//
//  ListContactsView.swift
//  najahni
//
//  Created by bairem mohamed on 13/12/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListContactsView: View {
    @State var contacts:[String:[Message]]
    @State var users:[User]
    var body: some View {
        ScrollView {
            VStack{
                ForEach(users) { user in
                    NavigationLink {
                        messageView(contactMsgs: Binding(get: {
                            contacts[user.id] ?? []
                        }, set: { val, tra in
                            contacts[user.id] = val
                        }), user: user)
                    }label:{
                        ContactCard(user: user,lastMsg: contacts[user.id]?.last?.msgContent ?? "test",you: contacts[user.id]?.last?.senderid.elementsEqual(user.id) ?? true)
                    }
                }
            }
        }
        .navigationTitle(Text("Messanger"))
    }
}

struct ListContactsView_Previews: PreviewProvider {
    @State static var users = [UserFix]
    @State static var contacts = ["1":[Message(msgContent: "hello", senderid: UserFix.firstname, receiverid: "0")]]
    static var previews: some View {
        ListContactsView(contacts: contacts, users: users)
        //ContactCard()
    }
}

struct ContactCard: View {
    @State var user:User
    @State var lastMsg = "text"
    @State var you = false
    var body: some View {
        HStack{
            HStack{
                WebImage(url: URL(string:"\(URL_BASE_APP)\(user.image ?? "")"))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70.0, height: 70.0)
                VStack {
                    HStack {
                        Text("\(user.firstname) \(user.lastname)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    HStack {
                        if(!you){
                            Text("You:\(lastMsg)")
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .foregroundColor(.black)
                            .padding(.horizontal)
                        }else{
                            Text(lastMsg)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                    }
                }
                Spacer()
            }
            .padding([.leading, .bottom, .trailing])
        }
    }
}
