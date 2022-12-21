//
//  TrainerVerificationView.swift
//  najahni
//
//  Created by bairem mohamed on 29/11/2022.
//

import SwiftUI

struct VerifyTrainerView: View {
    @State var showFileUpload = false
    @State var FileName = "Import"
    @State var file = Data()
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        VStack(spacing: 30){
            HStack {
                Text(LocalizedStringKey("Let's_take_a_look"))
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                    .padding(0.0)
                    .font(.system(size: 40))
            }
            Image("verif")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            Text(LocalizedStringKey("Trainer_verif"))
            Spacer()
            Button(action: {showFileUpload = true}){
                Text(FileName)
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                }
            Spacer()
            Button(action: {
                viewModel.uploadBadge(file: file) {
                    (success) in
                    if success {
                        print("jawha nice")
                    }else {
                        print("not logged in")
                        
                    }
                }
            }){
                Text("Verify")
                    .foregroundColor(.white)
            }.frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
                   
            .fileImporter(isPresented: $showFileUpload, allowedContentTypes: [.image,.pdf]) { result in
                do {
                     var fileurl = try result.get()
                    try FileName = fileurl.lastPathComponent
                    file = try Data(contentsOf: fileurl)
                    
               }
                catch  {
                    print(error)
                }
                }
        }
        .padding(.all)
        
    }
}

struct VerifyTrainerView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyTrainerView()
    }
}
