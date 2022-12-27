//
//  QuizView.swift
//  najahni
//
//  Created by bairem mohamed on 27/12/2022.
//

import SwiftUI

struct QuizView: View {
    @State var quiz:Quiz
    @State var progress = 0
    var body: some View {
        TabView(selection: $progress){
            ForEach(quiz.questions.indices){i in
               var question = quiz.questions[i]
                QuestionView(question: question, indexQuestion: i,completed: i==quiz.questions.count-1){
                    print("opp")
                    withAnimation {
                        progress = i+1
                    }
                }.tag(i)

            }
        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quiz: Quiz(id: "1", courseid: "2", questions: [Question(quizid: "", question: "vvvvv", propositions: ["1","2","4"], indexResponse: 1),Question(quizid: "2", question: "ggeeeegg", propositions: ["1","2","3"], indexResponse: 0),Question(quizid: "2", question: "dfdgfg", propositions: ["1","2","99"], indexResponse: 0)]))
        /*QuestionView(question: Question(quizid: "", question: "who is albert", propositions: ["Prop 1","Prop 2","Prop 3"], indexResponse: 0),indexQuestion: 1)*/
        /*propositionView(title: "Weld houmti", action: {_,_ in
            
        }, indexQuestion: 0)*/
    }
}
struct QuestionView: View {
    @State var isLast = false
    @State var question:Question
    @State var indexQuestion:Int
    @State var completed = false
    @State var action:()->Void
    @State var indexAnswer:Int = -1
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                Text("Question \(indexQuestion+1): \(question.question)")
                    .font(.title)
                    .foregroundColor(Color("primaryColor"))
                    
                ForEach(question.propositions.map({ st in
                    return ListData(name: st)
                })){ listdata in
                    propositionView(title: listdata.name) {
                        if(question.propositions.firstIndex(of: listdata.name) ?? -1 == indexAnswer){
                            return true
                        }
                        else{
                            return false
                        }
                        
                        
                    } onSelect: {
                        indexAnswer = question.propositions.firstIndex(of: listdata.name) ?? -1
                    }

                }
                    .padding(.all)
                
            }
            if(completed){
                NavigationLink(destination: {
                    EmptyView()
                }, label: {
                    Text("Complete")
                        .foregroundColor(.blue)
                        
                })

            }else{
                Text("Next")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        print("hola")
                        action()
                    }
            }
                            
            /*Button(action: {
                action()
            }) {
                Text("next")
            }*/
            
        }
        
    }
}
struct propositionView: View {
    @State var title:String
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
                Text("\(title)")
                .lineLimit(6)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.all)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
        .cornerRadius(10)
    }
}
