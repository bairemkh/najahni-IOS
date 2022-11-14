//
//  SplashView.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI

struct SplashView: View {
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
}



struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
