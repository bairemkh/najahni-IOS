//
//  AddQuizView.swift
//  najahni
//
//  Created by bairem mohamed on 2/1/2023.
//

import SwiftUI

struct AddQuizView: View {
    @State var quiz:Quiz
    @State var nbQuestions = 0
    @State var isDone = false
    var body: some View {
        NavigationView{
            VStack {
                TabView(selection: $nbQuestions){
                    ForEach(quiz.questions.indices,id: \.self){i in
                        VStack {
                            AddQuestionView(question: Binding(get: {
                                return quiz.questions[i]
                            }, set: { newVal, tra in
                                quiz.questions[i] = newVal
                                //quiz.questions[i] = question
                            }))
                        }
                        .tag(i)
                        }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Button {
                    nbQuestions+=1;
                    quiz.questions.append(Question(quizid: quiz.id, question: "Put A question", propositions: ["proposition 1","proposition 2"], indexResponse: 0))
                    print("questions : \(quiz.questions)")
                    
                } label: {
                    Text("Add question")
                        .fontWeight(.bold)
                        .foregroundColor(Color("primaryColor"))
                }

            }
        }
            .navigationBarTitle(
                Text("Add Quiz"),
                displayMode: .inline
              )
            .navigationBarItems(trailing: NavigationLink(isActive: $isDone, destination: {
                HostingTabBarView()
            }, label: {
                Text("Confirm").onTapGesture {
                    for question in quiz.questions {
                        QuizServices.addQuestion(quizid: quiz.id,question: question) { canPass, ques in
                            
                        }
                    }
                    NajahniSocketManager.initSocket()
                    var socket = NajahniSocketManager.socket
                    let notifJson = ["Content" : "a new course has dropped , go and check it","title":"New Course"]
                    socket.on(clientEvent: .connect) { data, _ in
                        socket.emit("notification", notifJson)
                    }
                    isDone = true
                }
            }))
    }
}

struct AddQuizView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuizView(quiz: Quiz(courseid: "", questions: [Question]()))
        /*AddQuestionView(question: Question(quizid: "", question: "esùi", propositions: ["Proposetion 1","Proposetion 2"], indexResponse: 0))*/
    }
}

struct AddQuestionView: View {
    @Binding var question:Question
    @State var indexAnswer:Int = 0
    var body: some View {
        VStack{
            TextField("title", text: $question.question)
                .padding(.all)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height: 80)
            ScrollView {
                ForEach (question.propositions.indices,id: \.self){ i in
                    TextField("title", text: $question.propositions[i])
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                }
            }
            Button {
                question.propositions.append("new Proposition")
            } label: {
                HStack {
                    Image(systemName: "plus.app.fill")
                        .foregroundColor(Color("primaryColor"))
                    Text("Add a proposition")
                        .foregroundColor(Color("primaryColor"))
                }
            }

            HStack {Text("The Correct answer is :")
                Picker(selection: $indexAnswer, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    ForEach(question.propositions.indices,id: \.self){ i in
                        Text(question.propositions[i])
                    }
                }.accentColor(Color("primaryColor"))
                    .onChange(of: indexAnswer) { newValue in
                        question.indexResponse = newValue
                    }
            }
        }
        .padding(.all)
    }
}
struct addPropositionView: View {
    @Binding var title:String
    @State var selected:()->Bool
    @State var onSelect:()->Void
    var body: some View {
        HStack {
            Button {
                onSelect()
            } label: {
                if(selected()){
                    Image(systemName: "circle.circle.fill")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.white)
                }else{
                    Image(systemName: "circle.circle")
                        .resizable()
                        .frame(width: 25,height: 25)
                        .foregroundColor(.white)
                }
                
            }
            TextField("Title", text: $title)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.all)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
        .cornerRadius(10)
    }
}
