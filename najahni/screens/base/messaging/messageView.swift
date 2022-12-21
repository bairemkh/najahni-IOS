//
//  messageView.swift
//  najahni
//
//  Created by bairem mohamed on 12/12/2022.
//
import SwiftUI
import SocketIO
import SwiftyJSON
import SDWebImageSwiftUI
class messanger: ObservableObject{
    private var manager = SocketManager(socketURL: URL(string: URL_BASE_APP)!,config: [.log(false),.reconnects(true)])
    //@Published var messages : [Message] = []
    var socket :SocketIOClient
    func sendMessage(message:String,id:String) {
        print("test \(socket.status)")
        let messageJson = ["msgContent" : message,"senderid":SessionManager.currentUser!.id,"receiverid":id,"_id":UUID().uuidString]
        socket.emit("onMessage", messageJson)
    }
    init(){
        socket = manager.defaultSocket
        
        socket.connect()
        
    }
    func initSocket(user:User,action:@escaping(Message)->Void){
        socket.on(clientEvent: .connect) { [self]data, ack in
            socket.on(user.id) { data, ack in
                let dataJson = JSON(data[0])["msg"]
                action(MessageServices.makeItem(jsonItem: dataJson))
            }
        }
        socket.on(clientEvent: .connect) { [self]data, ack in
            socket.on(SessionManager.currentUser!.id) { data, ack in
                let dataJson = JSON(data[0])["msg"]
                action(MessageServices.makeItem(jsonItem: dataJson))
            }
        }
    }
}

struct messageView: View {
    @Binding var contactMsgs : [Message]
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
                    WebImage(url: URL(string:"\(URL_BASE_APP)\(user.image ?? "")"))
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
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack{
                        Group{
                            ForEach(contactMsgs){ message in
                                messageBubble(user: user, message:message.msgContent,isCurrentUser: message.receiverid.elementsEqual(user.id))
                            }
                            
                        }
                        .padding(.all)
                    }
                }.onChange(of: contactMsgs.last!.id) { newValue in
                    withAnimation {
                        proxy.scrollTo(newValue, anchor: .bottom)
                    }
                }
                .onAppear{
                    withAnimation {
                        proxy.scrollTo(contactMsgs.last!.id, anchor: .bottom)
                    }
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
                            viewModel.sendMessage(message: message,id: user.id)
                        message = ""
                        }}) {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color("primaryColor"))
                }
            }
            .onAppear{
                viewModel.initSocket(user: user, action: { message in
                    contactMsgs.append(message)
                })
            }
            .padding(.all)
            .navigationBarBackButtonHidden()
        }
    }
    
}

struct messageView_Previews: PreviewProvider {
    @State static var messages = [Message]()
    static var previews: some View {
        messageView(contactMsgs: $messages, user: UserFix)
    }
}



struct messageBubble :View {
    @State var user = UserFix
    @State var message : String
    @State var isCurrentUser = false
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
                    WebImage(url: URL(string:"\(URL_BASE_APP)\(user.image ?? "")"))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50.0, height: 50.0)
                Text(message)
                    .foregroundColor(Color("primaryColor"))
                    .padding(.all)
                    .background(Rectangle().foregroundColor(Color("primaryColor"))
                        .opacity(0.2)
                        .cornerRadius(30))
                Spacer()
            }
            
        }
        
    }
    
}
