//
//  UserNode.swift
//  WhatsAppClone
//
//  Created by Apple on 23/06/2026.
//

import Foundation


struct UserNode{
    let currentCursor:String?
    let users:[UserModel]
   static  var emptyNode :UserNode = UserNode(currentCursor:nil, users: [])
    
}
