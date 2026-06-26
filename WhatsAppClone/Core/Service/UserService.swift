//
//  UserService.swift
//  WhatsAppClone
//
//  Created by Apple on 23/06/2026.
//

import Foundation
import Firebase
import FirebaseDatabase


protocol UserProvider{
    static var shared:UserProvider{get}
    
    func fetchPaginatedUsers(lastCursor:String?, pageSize:UInt)async throws->UserNode
    
}


final class UserService: UserProvider{

    private init(){}
    static let shared:UserProvider = UserService()
    
    
    
    func fetchPaginatedUsers(lastCursor : String?, pageSize: UInt) async throws -> UserNode {
        let userRef = Database.database().reference().child("users")
        
        let mainSnapshot:DataSnapshot
        
        
        if lastCursor == nil{
            mainSnapshot = try await  userRef.queryLimited(toLast: pageSize).getData()
            
        }else{
            
            mainSnapshot = try await userRef.queryOrderedByKey()
                .queryEnding(atValue: lastCursor)
                .queryLimited(toLast: pageSize+1)
                .getData()
        }
        
        guard let firstObject = mainSnapshot.children.allObjects.first as? DataSnapshot ,
                  let allObjects = mainSnapshot.children.allObjects as? [DataSnapshot] else{return .emptyNode}
            
        let users:[UserModel] = allObjects.compactMap{snapshot in
                let userDict = snapshot.value as? [String:Any] ?? [:]
                return UserModel(dictionary: userDict)
            }
            
        if(users.count == mainSnapshot.childrenCount){
            let filteredUsers = lastCursor == nil ? users : users.filter{$0.uid != lastCursor}
                return UserNode(currentCursor: firstObject.key, users: filteredUsers)
        }
       return .emptyNode
            
        
        
    }
}
