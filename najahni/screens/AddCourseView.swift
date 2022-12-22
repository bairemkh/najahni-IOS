//
//  AddCourseView.swift
//  najahni
//
//  Created by bairem mohamed on 26/11/2022.
//

import SwiftUI

struct AddCourseView: View {
    @StateObject var viewmodel = AddCourseViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack (spacing: 30){
                        HStack{
                            Text("Cancel")
                                .fontWeight(.black)
                                .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                                .multilineTextAlignment(.leading)
                                .onTapGesture {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            Spacer()
                        }
                        HStack {
                            Text(LocalizedStringKey("Create_a_new_Course"))
                                .fontWeight(.black)
                                .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                                .multilineTextAlignment(.leading)
                                .padding(0.0)
                                .frame(width: 300.0, height: 100.0)
                                .font(.system(size: 40))
                        }
                        Image(uiImage: viewmodel.image)
                            .resizable()
                            .frame(width: 300,height: 200)
                            .aspectRatio(contentMode: .fill)
                            .onTapGesture {
                                viewmodel.showFileUpload = true
                            }
                            .sheet(isPresented: $viewmodel.showFileUpload) {
                                // Pick an image from the photo library:
                                ImagePicker(sourceType: .photoLibrary, selectedImage: $viewmodel.image)
                                
                            }
                        HStack {
                            TextField(LocalizedStringKey("Course_name"), text: $viewmodel.name)
                                .padding(.all)
                                .padding(.leading)
                                .padding(.trailing)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("BackgroundColor")/*@END_MENU_TOKEN@*/)
                                .cornerRadius(20)
                            .shadow(color: .gray, radius: 3)
                            TextField("Price", text: $viewmodel.price)
                                .padding(.all)
                                .padding(.leading)
                                .padding(.trailing)
                                .cornerRadius(20)
                                .keyboardType(.numberPad)
                        }
                        HStack(spacing:50){
                            Picker("Level", selection: $viewmodel.selection) {
                                /*ForEach(list){level in
                                    Text(level.name).tag(0)
                                }*/
                                /*Text("level 1").tag(0)
                                 Text("level 2").tag(1)
                                 Text("level 3").tag(2)*/
                                ForEach(0..<viewmodel.list.count)
                                    {
                                        Text(viewmodel.list[$0].name).tag(viewmodel.list[$0])
                                    }
                            }
                            .accentColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                            NavigationLink(destination:  CustomPicker2View(items: viewmodel.fields,selected: $viewmodel.selectedList)){
                                HStack {
                                    Text("Select")
                                        .foregroundColor(Color("primaryColor"))
                                    Spacer()
                                        .frame(width: 50,height: 0)
                                    Text("\(viewmodel.selectedList.count) Fields")
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                        }
                        //editor
                        TextEditor(text: $viewmodel.description)
                            .padding(.all)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                            .shadow(color: Color.gray, radius: 3)
                            .lineLimit(/*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .frame(height: 100)
                        NavigationLink(destination: EmptyView(), isActive: $viewmodel.canPass) {
                            Button(action: {
                                viewmodel.addCourse { message, canPass  in
                                    if(canPass){
                                        viewmodel.canPass = true
                                    }
                                    viewmodel.errorMsg = message
                                    viewmodel.showAlert = true
                                }
                            }) {
                                Text(LocalizedStringKey("Next"))
                                    .foregroundColor(Color.white)
                                    .frame(width: 300.0,height: 60.0)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                                        .cornerRadius(25)
                            }
                            .alert(isPresented: $viewmodel.showAlert){
                                Alert(title: Text ("Alert") , message: Text(viewmodel.errorMsg), dismissButton: .default(Text("close")))
                        }
                        }
                        
                        
                        //
                        
                    }
                    .padding(.all)
                    
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct AddCourseView_Previews: PreviewProvider {
        static var previews: some View {
            AddCourseView()
        }
    }
}
