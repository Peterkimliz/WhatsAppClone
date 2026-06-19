//
//  UserModel.swift
//  WhatsAppClone
//
//  Created by Apple on 18/06/2026.
//

import SwiftUI

struct UserModel:Identifiable ,Codable,Hashable{
    
    let uid:String
    let email:String
    let username:String
    var bio:String? = nil
    var profileImageUrl:String?
    
    var id:String{
        return uid
    }
    
    var bioUnwraapped:String{
        return bio ?? "Hi! Iam using Whatsappp"
    }
    
}


extension UserModel {
    
    init(dictionary:[String:Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
    
}
