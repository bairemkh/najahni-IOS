//
//  DiscussionView.swift
//  najahni
//
//  Created by najahni on 9/12/2022.
//

import SwiftUI

struct DiscussionView: View {
   // var message : Message
    var course : Course
    @StateObject var messagesManager : MessagesManager
    init(course: Course,messageManager:MessagesManager) {
        self.course = course
        self.messagesManager = MessagesManager(collection: course.id)
    }
    
    var body: some View {
        VStack {
            TitleRow(user: course.idowner!)
            
            ScrollViewReader { proxy in
                ScrollView {
                 
                    ScrollView {
                                       ForEach(messagesManager.messages, id: \.id) { message in
                                           MessageBubble(message: message)
                                       }
                                   }
                    
                }
         // Custom cornerRadius modifier added in Extensions file
               /* .onChange(of: messagesManager.lastMessageId) { id in
                    // When the lastMessageId changes, scroll to the bottom of the conversation
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }*/
            }
            MessageField(course:course)
                .environmentObject(messagesManager)
            
        }
        .background(Color("priamryColor"))
        
       
            
    }
}


struct DiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionView(course: CourseFix)
    }
}
