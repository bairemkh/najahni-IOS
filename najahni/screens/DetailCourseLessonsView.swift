//
//  DetailCourseLessonsView.swift
//  najahni
//
//  Created by najahni on 7/12/2022.
//

import SwiftUI
import SlidingTabView

struct DetailCourseLessonsView: View {
    @State var course : Course
    @State private var selectedTabIndex = 0
    @State var isCompleted = false
    @State private var showReview = false
    @StateObject var reviewViewModel = ReviewViewModel()
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Lessons", "Reviews"],activeAccentColor: Color("primaryColor"),selectionBarColor: Color("primaryColor"))
                if(selectedTabIndex == 0){
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(course.sections) { section in
                            SectionCardView(section: section)
                        
                        }
                        if(!course.quiz.questions.isEmpty)
                        {
                            QuizViewPart(isBuyed: true, quiz: $course.quiz)
                        }
                    }
                }else{
                    ScrollView(.vertical,showsIndicators: false) {
                        ForEach(course.comments) { comment in
                            CommentCardView(comment: comment)
                                .padding(.all)
                        
                        }
                    }
                    HStack {
                        TextField("", text: $reviewViewModel.content)
                            .padding(.all)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848, opacity: 0.445)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                        Spacer()
                            .frame(width: 30)
                        Button(
                            action: {
                                if(!reviewViewModel.content.isEmpty){
                                    reviewViewModel.addComment { isOk, status in
                                        print(isOk)
                                    }
                                    reviewViewModel.content = ""
                                }}) {
                            Image(systemName: "paperplane.circle.fill")
                                .resizable()
                                .frame(width: 40,height: 40)
                                .foregroundColor(Color("primaryColor"))
                        }
                    }
                    .padding(.all)
                }
            }
        }.navigationBarTitle(
            Text(course.title),
            displayMode: .inline
          )
        .navigationBarItems(trailing: Button {
           showReview = true
            
        }label: {
            //Text(LocalizedStringKey("Add_review"))
            Image(systemName: "star.bubble.fill")
                .resizable()
                .frame(width: 25,height: 25)
                .foregroundColor(Color("primaryColor"))
        })

        .sheet(isPresented: $showReview){
            HStack{
                Text(LocalizedStringKey("Send_your_review_for_course"))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.356, green: 0.315, blue: 0.84))
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 24))
            }
            .padding([.top, .leading, .trailing])
            Spacer()
                .frame(height: 100.0)
            VStack(alignment: .center){
                Text(LocalizedStringKey("Note_Compration"))
                RatingView(rating: 0, action: { rate in
                    reviewViewModel.ratingComp = rate
                    print("rating comp \(reviewViewModel.ratingComp)")
                })
                
                Spacer()
                    .frame(height: 20.0)
                
                Text(LocalizedStringKey("Note_Trainer"))
                RatingView(rating: 0, action: { rate in
                    reviewViewModel.ratingTrainer = rate
                    print("rating trainer \(reviewViewModel.ratingTrainer)")
                })
                Spacer()
                    .frame(height: 20.0)
                Text(LocalizedStringKey("Note_Content"))
                RatingView(rating: 0,action: { rate in
                    reviewViewModel.ratingContent = rate
                    print("rating content \(reviewViewModel.ratingContent)")
                })
                Spacer()
                    .frame(height: 24.0)
                Button {
                    reviewViewModel.addReview { isOk, status in
                        print("review send\(isOk)")
                        if(!isOk){
                           showAlert = true
                        } else {
                            showReview = false
                        }
                        //showReview = false
                       
                        
                    }
                }label: {
                    Text(LocalizedStringKey("Send_review"))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 300.0,height: 60.0)
                        .background(Color("primaryColor"))
                        .cornerRadius(25)
                }

            }
            .background(Color("BackgroundColor"))
            .padding(.all)
            .alert("Aleardy reviewed", isPresented: $showAlert) {
                Button("OK", role: .cancel) { showReview = false}
            }
            Spacer()
        }
  
        .onAppear{
            reviewViewModel.course = course
            print(course)
        }
       
        
    }
}

struct DetailCourseLessonsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCourseLessonsView(course: CourseFix)
    }
}
