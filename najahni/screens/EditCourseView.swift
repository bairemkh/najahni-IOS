import SwiftUI
import SDWebImageSwiftUI
struct EditCourseView: View {
    @StateObject var viewmodel = EditCourseViewModel()
    var course:Course
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
                            Text("Create a new Course")
                                .fontWeight(.black)
                                .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                                .multilineTextAlignment(.leading)
                                .padding(0.0)
                                .frame(width: 300.0, height: 100.0)
                                .font(.system(size: 40))
                        }
                        WebImage(url: URL(string: viewmodel.course.image))
                            .resizable()
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .padding()
                            .frame(width: 120.0, height: 120.0)
                            .aspectRatio(contentMode: .fill)
                        
                        HStack {
                            TextField("Course name", text: $viewmodel.course.title)
                                .padding(.all)
                                .padding(.leading)
                                .padding(.trailing)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                                .cornerRadius(20)
                            .shadow(color: .gray, radius: 3)
                            TextField("Price (Optionnal)", text: $viewmodel.price)
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
                        TextEditor(text: $viewmodel.course.description)
                            .padding(.all)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 1.0, blue: 1.0)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                            .shadow(color: Color.gray, radius: 3)
                            .lineLimit(/*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
                            .frame(height: 100)
                        Button(action: {}) {
                            Text("Next")
                                .foregroundColor(Color.white)
                                .frame(width: 300.0,height: 60.0)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848)/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(25)
                        }
                        
                        
                        //
                        
                    }
                    .padding(.all)
                    .onAppear{
                        viewmodel.course = course
                        viewmodel.selectedList = course.fields.map({ f in
                            return ListData(name: f.rawValue)
                        })
                        viewmodel.price = course.price.description
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct AddCourseView_Previews: PreviewProvider {
        static var previews: some View {
            //AddCourseView()
            EditCourseView(course: Course(id: "", title: "Kotlin course", fields: [Fields.Arts,Fields.Programming], level: "Beginner", description: "Test test test etste", isPaid: false, image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgithub.com%2Ftopics%2Fkotlin&psig=AOvVaw3Eu_Jmp69SUelgSgNoCmC4&ust=1670350756865000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMii8M2L4_sCFQAAAAAdAAAAABAD", price: 200, idowner: UserFix, isArchived: false, createdAt: "", updatedAt: ""))
        }
    }
}
