//
//  SocketManager.swift
//  najahni
//
//  Created by bairem mohamed on 22/12/2022.
//

import Foundation
import SocketIO
import SwiftyJSON
class NajahniSocketManager {
    private var manager = SocketManager(socketURL: URL(string: URL_BASE_APP)!,config: [.log(false),.reconnects(true)])
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
    func initSocketMessaging(user:User,action:@escaping(Message)->Void){
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
