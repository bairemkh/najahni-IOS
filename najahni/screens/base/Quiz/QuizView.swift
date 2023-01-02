//
//  QuizView.swift
//  najahni
//
//  Created by bairem mohamed on 27/12/2022.
//

import SwiftUI

struct QuizView: View {
    @State var quiz:Quiz
    @State var score:[Int] = []
    @State var progress = 0
    var body: some View {
        NavigationView{
            VStack {
                TabView(selection: $progress){
                    ForEach(quiz.questions.indices){i in
                       var question = quiz.questions[i]
                        QuestionView(question: question, indexQuestion: i,completed: i==quiz.questions.count-1){ scoreQuestion in
                            withAnimation {
                                score[i] = scoreQuestion
                                if progress < quiz.questions.count-1{
                                    print("in")
                                    progress = i+1
                                }
                                print(score)
                            }
                        }.tag(i)

                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onAppear{
                        score = quiz.questions.map({ q in
                            return 0
                        })
                }
                ProgressView(value: Double(progress+1)/Double(quiz.questions.count))
                    .padding(.all)
                    .accentColor(/*@START_MENU_TOKEN@*/Color("secondaryColor")/*@END_MENU_TOKEN@*/)
                Spacer()
                if progress == quiz.questions.count-1{
                    NavigationLink(destination: QuizResultView(score: score,quiz: quiz)) {
                        Text("Complete the quiz")
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(width: 300.0,height: 60.0)
                            .background(Color("primaryColor"))
                            .cornerRadius(25)
                    }
                }
                
            }
        }.navigationBarBackButtonHidden()
        
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
    @State var completed : Bool
    @State var action:(Int)->Void
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
                        if(indexAnswer == question.indexResponse)
                        {
                            action(10)
                        }else{
                            action(0)
                        }
                    }

                }
                    .padding(.all)
                
            }
           /* if(completed){
                NavigationLink(isActive: $completed,destination: {
                    EmptyView()
                }, label: {
                    Text("Complete")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0,height: 60.0)
                        .background(Color("primaryColor"))
                        .cornerRadius(25)
                        .onTapGesture {
                            if(indexAnswer == question.indexResponse)
                            {
                                action(10)
                            }else{
                                action(0)
                            }
                            completed = true
                        }
                        
                })

            }else{
                Text("Next")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 300.0,height: 60.0)
                    .background(Color("primaryColor"))
                    .cornerRadius(25)
                    .onTapGesture {
                        if(indexAnswer == question.indexResponse)
                        {
                            action(10)
                        }else{
                            action(0)
                        }
                    }
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
