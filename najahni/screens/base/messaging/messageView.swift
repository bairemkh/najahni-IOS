//
//  messageView.swift
//  najahni
//
//  Created by bairem mohamed on 12/12/2022.
//
import SwiftUI
import SocketIO
import SwiftyJSON
class messanger: ObservableObject{
    private var manager = SocketManager(socketURL: URL(string: URL_BASE_APP)!,config: [.log(false),.reconnects(true)])
    @Published var messages = [Message]()
    var socket :SocketIOClient
    func sendMessage(message:String,id:String) {
        print("test \(socket.status)")
        let messageJson = ["msgContent" : message,"senderid":"bairem","receiverid":id,"id":UUID().uuidString]
        socket.emit("onMessage", messageJson)
    }
    init(){
        socket = manager.defaultSocket
        socket.on(clientEvent: .connect) { [self] data, ack in
            socket.on("send") { data, ack in
                let dataJson = JSON(data[0])["msg"]
                self.messages.append(MessageServices.makeItem(jsonItem: dataJson))
            }
        }
        socket.connect()
        
    }
}

struct messageView: View {
    @State var contactMsgs = [Message]()
    @State var user:User
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = messanger()
    @State var message = ""
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 30,height: 30)
                    .foregroundColor(Color("primaryColor"))
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Image("user")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70.0, height: 70.0)
                Text(user.firstname)
                    .font(.title)
                    .fontWeight(.black)
                    .padding(.horizontal)
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color("primaryColor")/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding([.leading, .bottom, .trailing])
            ScrollView(showsIndicators: false) {
                VStack{
                    Group{
                        ForEach(viewModel.messages){ message in
                            messageBubble(message:message.msgContent,isCurrentUser: message.senderid.elementsEqual(user.id))
                        }
                        
                    }
                    .padding(.all)
                }
            }
            HStack {
                TextField("", text: $message)
                    .padding(.all)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.356, green: 0.315, blue: 0.848, opacity: 0.445)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .autocorrectionDisabled()
                Spacer()
                    .frame(width: 30)
                Button(
                    action: {
                        if(!message.isEmpty){
                        viewModel.sendMessage(message: message,id: "hama")
                        message = ""
                        }}) {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color("primaryColor"))
                }
            }
            .onAppear{
                viewModel.messages = contactMsgs
            }
            .padding(.all)
            .navigationBarBackButtonHidden()
        }
    }
    
}

struct messageView_Previews: PreviewProvider {
    static var previews: some View {
        messageView(user: UserFix)
        //messageBubble(message:"testing message")
    }
}



struct messageBubble :View {
    @State var message : String
    @State var isCurrentUser = true
    var body: some View {
        if isCurrentUser{
            HStack {
                Spacer()
                Text(message)
                    .foregroundColor(.white)
                    .padding(.all)
                .background(Rectangle().foregroundColor(Color("primaryColor")).cornerRadius(30))
            }
        }else{
            HStack {
                Image("user")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50.0, height: 50.0)
                Text(message)
                    .foregroundColor(Color("primaryColor"))
                    .padding(.all)
                    .background(Rectangle().foregroundColor(Color(red: 0.694, green: 0.509, blue: 0.922, opacity: 0.214)).cornerRadius(30))
                Spacer()
            }
            
        }
        
    }
    
}
