//
//  Channel.swift
//  WhatsAppClone
//
//  Created by Apple on 24/06/2026.
//

import Foundation

struct ChannelItem{
    let id:String
    let name:String?
    let creationDate:Date
    let lastmessage:String
    let lastMessageTimeStamp:Date
    let membersCount:UInt
    let thumbnailUrl:String?
    let isGroupChat:Bool
    let adminsUids:[String]
    let membersUids:[String]
    
    
    static let placeholder = ChannelItem(
        id: "1",
        name: "Test",
        creationDate: Date(),
        lastmessage: "Hello There",
        lastMessageTimeStamp: Date(),
        membersCount: 2,
         thumbnailUrl: nil,
        isGroupChat:false,
        adminsUids: [],
        membersUids: []
    )
}
