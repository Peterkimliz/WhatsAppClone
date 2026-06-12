//
//  UserItem.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI

struct UserItem:Identifiable, Hashable,Codable{
    
    let uid:String
    let username:String
    let email:String
    var bio:String? = nil
    var profileImageUrl:String? = nil
    
    
    var id:String{
      return uid
    }
    
    var bioUrwrapped:String{
        return bio ?? "Hi there!  Iam using Whatsapp"
    }
    
    
    
}
