//
//  SettingsView.swift
//  najahni
//
//  Created by bairem mohamed on 29/11/2022.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        VStack{
            Spacer().frame(height: 50)
            HStack {
                Image(systemName: "circle.righthalf.filled")
                    .foregroundColor(Color("primaryColor"))
                Text("Dark mode")
                    .padding(.leading)
                Spacer()
                Toggle(isOn: $isDarkMode) {
                    /*if darkModeOn{
                        window?.overrideUserInterfaceStyle = .dark
                    }else{
                        window?.overrideUserInterfaceStyle = .light
                    }*/
                }
                .toggleStyle(SwitchToggleStyle(tint: Color("primaryColor")))
            }.padding(.all, 12.0)
            Divider()
        
            
            CustomButtonView(icon: "trash.fill",buttonText: "Delete Account")
            
            Spacer()
        }
        .background(Color("BackgroundColor"))
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .accentColor(.primary)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
