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
    static var manager = SocketManager(socketURL: URL(string: URL_BASE_APP)!,config: [.log(false),.reconnects(true)])
    static var socket :SocketIOClient = manager.defaultSocket
    static func initSocket(){
        socket.connect()
        print("Socket state init: \(socket.status)")
    }
    static func listening(event:String,action:@escaping([Any])->Void){
        socket.on(clientEvent: .connect) { dataConn, ackConn in
            print("Socket state \(event): \(socket.status)")
            socket.on(event) { data, ack in
                action(data)
            }
        }
        
    }
}
