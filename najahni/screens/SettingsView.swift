//
//  SettingsView.swift
//  najahni
//
//  Created by bairem mohamed on 29/11/2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var onLogOut = false
    @State private var selectedLanguage = 0
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("language") private var language = Language.en
    var body: some View {
        VStack{
            Spacer().frame(height: 50)
            HStack {
                Image(systemName: "textformat.size")
                    .foregroundColor(Color("primaryColor"))
                Text("Language")
                    .padding(.leading)
                Spacer()
                Picker(selection: $selectedLanguage, label: Text("Pick your Language")) {
                    Text("English").tag(0)
                    Text("Francais").tag(1)
                }.onChange(of: selectedLanguage) { newValue in
                    if(newValue == 0){
                        language = Language.en
                    }
                    else{
                        language = Language.fr
                    }
                }
                

            }.padding(.all, 12.0)
            Divider()
            HStack {
                Image(systemName: "circle.righthalf.filled")
                    .foregroundColor(Color("primaryColor"))
                Text(LocalizedStringKey("Dark_mode"))
                    .padding(.leading)
                Spacer()
                Toggle(isOn: $isDarkMode) {
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("primaryColor")))
            }.padding(.all, 12.0)
            Divider()
            NavigationLink(destination: LoginView(), isActive: $onLogOut){
                CustomButtonView(icon: "trash.fill",buttonText: LocalizedStringKey("Delete_account")).onTapGesture {
                    UserService.deleteAccount { msg, logout in
                        print(msg)
                        SessionManager.logOut()
                        onLogOut = !logout
                    }
                }
                .foregroundColor(.red)
            }
            
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .accentColor(.primary)
            .environment(\.locale,.init(identifier: language.rawValue))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
