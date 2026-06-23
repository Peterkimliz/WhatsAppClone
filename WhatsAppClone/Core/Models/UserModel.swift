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
    
    static var dummyUsers:[UserModel] = [
         UserModel(uid: "errw6er1", email: "qa1@gmail.com", username: "Qauser1"),
         UserModel(uid: "errw6er2", email: "qa1@gmail.com", username: "Qauser2"),
         UserModel(uid: "errw6er3", email: "qa1@gmail.com", username: "Qauser3"),
         UserModel(uid: "errw6er4", email: "qa1@gmail.com", username: "Qauser4"),
         UserModel(uid: "errw6er5", email: "qa1@gmail.com", username: "Qauser5"),
         UserModel(uid: "errw6er6", email: "qa1@gmail.com", username: "Qauser6"),
         UserModel(uid: "errw6er7", email: "qa1@gmail.com", username: "Qauser7"),
         UserModel(uid: "errw6er8", email: "qa1@gmail.com", username: "Qauser8"),
         UserModel(uid: "errw6er9", email: "qa1@gmail.com", username: "Qauser9"),
         UserModel(uid: "errw6er10", email: "qa1@gmail.com", username: "Qauser10"),
         UserModel(uid: "errw6er11", email: "qa1@gmail.com", username: "Qauser11"),
         UserModel(uid: "errw6er12", email: "qa1@gmail.com", username: "Qauser12")
         
     ]
    
}
