//
//  SplashView.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI

import SwiftUI
import SwiftyJSON

/*struct SplashView: View {
    @State var isActive:Bool = false
    let welcome = LoginView()
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Image("Logo-Najahni")
                    .resizable()
                    .frame(width: 250.0 , height: 250)
                    .scaledToFit()
                
                Text("Najahni")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: welcome, isActive:$isActive,label: {EmptyView()})
            }
            .onAppear(perform: {self.gotoWelcomeScreen(time: 2.0)})
        }
        
        
    }
    func gotoWelcomeScreen(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
}*/
struct SplashView: View {
    @State var isActive:Bool = false
    let welcome = LoginView()
    var body: some View {
        ZStack{
            if SessionManager.token != nil {
                toProfile()
            }
            else
            {
                toLogin()
            }
        }.onAppear{
           
        }
        //toLogin()
    }
}



struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
struct toProfile: View {
    @State var isActive:Bool = false
    @State private var goToLogin:Bool = false
    let welcome = HostingTabBarView()
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Image("Logo-Najahni")
                    .resizable()
                    .frame(width: 250.0 , height: 250)
                    .scaledToFit()
                
                Text("Najahni")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                if goToLogin{
                    NavigationLink(destination: LoginView() , isActive:$isActive,label: {EmptyView()})
                }else
                {
                    NavigationLink(destination: welcome , isActive:$isActive,label: {EmptyView()})
                }
            }
            .onAppear(perform: {
               
                self.gotoWelcomeScreen(time: 2.0)})
        }
        
        
    }
    func gotoWelcomeScreen(time: Double) {
            DispatchQueue.main.async{
               // Task{await UserService.profile()}
                UserService.profile { isGood, user in
                    if(isGood){
                        SessionManager.currentUser = user
                        NajahniSocketManager.initSocket()
                        NajahniSocketManager.listening(event: "receive"){ data in
                                NotificationHandler.sendNotification(title: "notif", body: "\(data)")
                            }
                        NajahniSocketManager.listening(event: SessionManager.currentUser!.id) { data in
                            var message = MessageServices.makeItem(jsonItem: JSON(data[0]))
                            print(message)
                            NotificationHandler.sendNotification(title: message.senderid, body: message.msgContent)
                        }
                        goToLogin = false
                        self.isActive = true
                    }
                    else{
                        goToLogin = true
                        self.isActive = true
                    }
                    
                    print("1 --------->\(SessionManager.currentUser)")
                    print("1 --------->\(UserDefaults.standard.string(forKey: "role")!)")
                }
                
                
            }
        
    }
}

struct toLogin: View {
    @State var isActive:Bool = false
    let welcome = LoginView()
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Image("Logo-Najahni")
                    .resizable()
                    .frame(width: 250.0 , height: 250)
                    .scaledToFit()
                
                Text("Najahni")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: welcome , isActive:$isActive,label: {EmptyView()})
            }
            .onAppear(perform: {self.gotoWelcomeScreen(time: 2.0)
            
            })
        }
        
        
    }
    func gotoWelcomeScreen(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
}
