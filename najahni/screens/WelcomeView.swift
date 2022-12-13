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
        ScrollView {
            Text(text)
                .onAppear{
                    CourseService.getallcourses { isgod, list in
                        text = "\(list)"
                    }
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
