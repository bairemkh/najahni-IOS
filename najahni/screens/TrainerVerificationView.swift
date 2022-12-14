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
    var body: some View {
        VStack(spacing: 30){
            HStack {
                Text("Let's take a look")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                    .padding(0.0)
                    .font(.system(size: 40))
            }
            Image("verif")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            Text("In order to verify certain information, we need to make sure that you are a verified trainer, so we will ask you for proof such as certificates. You can send us an image or a pdf file of your certificate.")
            Spacer()
            Button(action: {showFileUpload = true}){
                Text(FileName)
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                }
            Spacer()
            Button(action: {}){
                Text("Verify")
                    .foregroundColor(.white)
            }.frame(width: 300.0,height: 60.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                .cornerRadius(25)
                   
            .fileImporter(isPresented: $showFileUpload, allowedContentTypes: [.image,.pdf]) { result in
                do {
                    try FileName = result.get().lastPathComponent
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
