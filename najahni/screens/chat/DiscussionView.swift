//
//  DiscussionView.swift
//  najahni
//
//  Created by najahni on 9/12/2022.
//

import SwiftUI

struct DiscussionView: View {
   var message : Message
    var course : Course
 
    
    var body: some View {
        VStack {
            TitleRow(user: course.idowner!)
            
            ScrollViewReader { proxy in
                ScrollView {
                
                    MessageBubble(message: message)
                          
                    
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
               
            
        }
        .background(Color("priamryColor"))
        
       
            
    }
}


struct DiscussionView_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionView(message: Message(id: "12345", text: "I've been coding applications from scratch in SwiftUI and it's so much fun!", received: true, timestamp: Date()),course: CourseFix)
    }
}
