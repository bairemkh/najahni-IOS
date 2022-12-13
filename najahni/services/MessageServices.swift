//
//  MessageServices.swift
//  najahni
//
//  Created by bairem mohamed on 13/12/2022.
//

import Foundation
import SwiftyJSON
class MessageServices{
    static func makeItem(jsonItem: JSON) -> Message {
        do {
            return try Message(id: jsonItem["_id"].stringValue,msgContent: jsonItem["msgContent"].stringValue,senderid:jsonItem["senderid"].stringValue ,receiverid: jsonItem["receiverid"].stringValue)
        } catch {
            print(error)
             return Message(msgContent: "", senderid: "", receiverid: "")
         }
        
    }
}
