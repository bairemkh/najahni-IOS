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
    private var manager = SocketManager(socketURL: URL(string: URL_SOCKET)!)
    @Published var messages = [String]()
    init(){
        let socket = manager.defaultSocket
        print(manager.socketURL)
        print("\(socket) 1-----\(socket.status)")
        socket.on(clientEvent: .connect) { data, ack in
            print("data===>\(data)")
        }
        print("\(socket) 2-----\(socket.status)")
    }
}

struct messageView: View {
    @StateObject var viewModel = messanger()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct messageView_Previews: PreviewProvider {
    static var previews: some View {
        messageView()
    }
}
