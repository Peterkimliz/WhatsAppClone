//
//  Channel.swift
//  WhatsAppClone
//
//  Created by Apple on 24/06/2026.
//

import Foundation
import FirebaseAuth
struct ChannelItem:Identifiable{
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
    var members:[UserModel] = [UserModel]()
    
    var membersExcludeMe:[UserModel]{
        let currentId = Auth.auth().currentUser?.uid
        return members.filter{ $0.uid != currentId}
        
    }
    
    var title:String{
        if let name = name{
            return name
        }
        if isGroupChat{
            return "Group Chat"
        }else{
            return membersExcludeMe.first?.username ?? ""
        }
        
    }
    
    
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

extension ChannelItem{
    
    init(dict:[String:Any]){
        self.id = dict[.id] as? String ?? ""
        self.name = dict[.name] as? String? ?? nil
        let creationInterval = dict[.creationDate] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: creationInterval)
        self.lastmessage = dict[.lastmessage] as? String ?? ""
        let lastMessageInterval = dict[.lastMessageTimeStamp] as? Double ?? 0
        self.lastMessageTimeStamp = Date(timeIntervalSince1970: lastMessageInterval)
        self.membersCount = dict[.membersCount] as? UInt ?? 0
        self.thumbnailUrl = dict[.thumbnailUrl] as? String ?? ""
        self.isGroupChat = dict[.isGroupChat] as? Bool ?? false
        self.adminsUids = dict[.adminsUids] as? [String] ?? []
        self.membersUids = dict[.membersUids] as? [String] ?? []
        self.members = dict[.members] as? [UserModel] ?? []
    
    }
}



extension String{
    
    static let id = "id"
    static let name = "name"
    static let creationDate = "creationDate"
    static let lastmessage = "lastmessage"
    static let lastMessageTimeStamp = "lastMessageTimeStamp"
    static let membersCount = "membersCount"
    static let thumbnailUrl = "thumbnailUrl"
    static let isGroupChat = "isGroupChat"
    static let adminsUids = "adminsUids"
    static let membersUids = "membersUids"
    static let members = "members"
    
    
    
}
