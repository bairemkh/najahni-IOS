//
//  WelcomeView.swift
//  najahni
//
//  Created by hamabairem on 7/11/2022.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var viewmodel = test()
    @State var text = ""
    var body: some View {
        Text(text)
            .onAppear{
                Task{
                    let req = await UserService.profile()
                    text = "req ====> \(req)"
                }
            }
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        WelcomeView()
        
    }
}

class test : ObservableObject {
    @Published var message = "waiting"
    func upload() async{
      // try await Task.sleep(nanoseconds: 2 * 1000000000)
    }
    
}
