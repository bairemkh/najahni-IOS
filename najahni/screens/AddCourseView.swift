//
//  AddCourseView.swift
//  najahni
//
//  Created by bairem mohamed on 26/11/2022.
//

import SwiftUI

struct AddCourseView: View {
    @State var name = ""
    @State var selection = 0
    @State var list = Level.allCases.map({ lvl in
        return ListData(name: lvl.rawValue)
    })
    @State var selectedList:[ListData] = []
    @State var description = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 30){
                    HStack {
                        Text("Create a new Course")
                            .fontWeight(.black)
                            .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                            .multilineTextAlignment(.leading)
                            .padding(0.0)
                            .frame(width: 300.0, height: 100.0)
                            .font(.system(size: 40))
                    }
                    Image("empty")
                        .resizable()
                        .frame(width: 300,height: 200)
                        .aspectRatio(contentMode: .fill)
                    HStack {
                        TextField("Course name*", text: $name)
                            .padding(.all)
                            .padding(.leading)
                            .padding(.trailing)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                        .shadow(color: .gray, radius: 3)
                        TextField("Price (Optionnal)", text: $name)
                            .padding(.all)
                            .padding(.leading)
                            .padding(.trailing)
                            .cornerRadius(20)
                            .keyboardType(.numberPad)
                    }
                    HStack(spacing:50){
                        Picker("Level", selection: $selection) {
                            /*ForEach(list){level in
                                Text(level.name).tag(0)
                            }*/
                            /*Text("level 1").tag(0)
                             Text("level 2").tag(1)
                             Text("level 3").tag(2)*/
                            ForEach(0..<list.count)
                                {
                                    Text(self.list[$0].name).tag(self.list[$0])
                                }
                        }
                        .accentColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination:  CustomPicker2View(items: list,selected: $selectedList)){
                            HStack {
                                Text("Select")
                                    .foregroundColor(Color("primaryColor"))
                                Spacer()
                                    .frame(width: 50,height: 0)
                                Text("\(selectedList.count) Fields")
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    }
                    //editor
                    TextEditor(text: $description)
                        .padding(.all)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(20)
                        .shadow(color: Color.gray, radius: 3)
                        .lineLimit(/*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                        .frame(height: 100)
                    Button(action: {}) {
                        Text("Create")
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 300.0,height: 60.0)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                        .cornerRadius(25)
                    
                    //
                    
                }
                .padding(.all)
                
                
            }
            
            
        }
        
        
    }
    
    
    struct AddCourseView_Previews: PreviewProvider {
        static var previews: some View {
            AddCourseView()
        }
    }
}
