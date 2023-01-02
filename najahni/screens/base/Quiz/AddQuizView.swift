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
    var body: some View {
        NavigationView{
            VStack {
                TabView(selection: $nbQuestions){
                    ForEach(quiz.questions.indices,id: \.self){i in
                        VStack {
                            AddQuestionView(question: Binding(get: {
                                return quiz.questions[i]
                            }, set: { newVal, _ in
                                quiz.questions[i] = newVal
                            }))
                        }
                        .tag(i)
                        }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Button {
                    nbQuestions+=1;
                    quiz.questions.append(Question(quizid: quiz.id, question: "Put A question", propositions: ["Proposetion 1","Proposetion 2"], indexResponse: 0))
                    print("questions : \(quiz.questions)")
                    
                } label: {
                    Text("add question")
                }

            }
        }.navigationBarBackButtonHidden()
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
            ForEach(question.propositions.map({ f in
                return ListData(name: f)
            })){ ld in
                var i = question.propositions.firstIndex(of: ld.name) ?? -1
                addPropositionView(title: Binding(get: {
                    return question.propositions[i]
                }, set: { newVal, _ in
                    question.propositions[i] = newVal
                }) ) {
                    if(i == indexAnswer){
                        return true
                    }
                    else{
                        return false
                    }
                } onSelect: {
                    indexAnswer = question.propositions.firstIndex(of: ld.name) ?? -1
                }

            }
            
        }
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
