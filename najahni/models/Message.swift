//
//  Message.swift
//  najahni
//
//  Created by bairem mohamed on 13/12/2022.
//

import Foundation
struct Message :Identifiable{
    let id, msgContent,senderid,receiverid: String
    init(id: String, msgContent: String, senderid: String, receiverid: String) {
        self.id = id
        self.msgContent = msgContent
        self.senderid = senderid
        self.receiverid = receiverid
    }
    init(msgContent: String, senderid: String, receiverid: String) {
        self.id = UUID().uuidString
        self.msgContent = msgContent
        self.senderid = senderid
        self.receiverid = receiverid
    }
}
