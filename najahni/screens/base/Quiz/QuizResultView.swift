//
//  QuizResultView.swift
//  najahni
//
//  Created by bairem mohamed on 30/12/2022.
//

import SwiftUI

struct QuizResultView: View {
    @State var score:[Int]
    @State var finalScore = 0
    @State var quiz :Quiz
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    Spacer()
                        .frame(height: 50)
                    Text("You Completed the Quiz with \((finalScore/score.count)*10)% right answers")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color("primaryColor"))
                    Spacer()
                        .frame(height: 30)
                    Group {
                        ForEach(score.indices){ i in
                            HStack{
                                Text("Question \(i+1)").font(.title2)
                                Spacer()
                                    .frame(width: 50)
                                if(score[i]==0){
                                    Text("Wrong").font(.headline)
                                        .foregroundColor(.red)
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(.red)
                                }else{
                                    Text("Correct").font(.headline)
                                        .foregroundColor(.green)
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                    
                                }
                            }
                            .padding(.all)
                        }
                    }
                    Spacer()
                        .frame(height: 30)
                    if((finalScore/score.count)*10>55){
                        VStack {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .frame(width: 100,height: 100)
                                .foregroundColor(.green)
                            Text("Yaaaay , you made Congrats.\n We send you a certificate via mail")
                                .multilineTextAlignment(.center)
                                .font(.title2)
                                .foregroundColor(.green)
                                
                        }.onAppear{
                            QuizServices.sendCertif(courseid: quiz.courseid) { isSent, code in
                                print("\(isSent) \(code)")
                            }
                        }
                    }else{
                        VStack {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 100,height: 100)
                                .foregroundColor(.red)
                            Text("Ouuch , You did not passed this test.\n next time you'll get it")
                                .multilineTextAlignment(.center)
                                .font(.title2)
                                .foregroundColor(.red)
                                
                        }

                    }
                    Spacer()
                        .frame(height: 100)
                    NavigationLink {
                        HostingTabBarView()
                    } label: {
                            Text("Go to Home")
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 300.0,height: 60.0)
                                .background(Color("primaryColor"))
                                .cornerRadius(25)
                        
                    }

                    

                }.onAppear{
                    score.forEach { sc in
                        finalScore = finalScore + sc
                    }
            }
            }
        }.navigationBarBackButtonHidden()
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView(score: [10,0,0,0],quiz: Quiz(courseid: "ffddgg", questions: []))
    }
}
