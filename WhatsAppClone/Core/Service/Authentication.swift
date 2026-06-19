//
//  Authentication.swift
//  WhatsAppClone
//
//  Created by Apple on 19/06/2026.
//

import SwiftUI
import Combine
import FirebaseDatabase
import FirebaseAuth


enum AuthStatus{
    case loading
    case loggedIn(UserModel)
    case loggedOut
}

protocol RootAuthenticationProvider{
    static var shared : RootAuthenticationProvider{get}

    var authState:CurrentValueSubject<AuthStatus,Never>{get}
    
    func autoLogin()async
    func fetchUserFromDatabase()async
}


final class RootAuthentication:RootAuthenticationProvider{
   
    private init(){
        Task{
          await  autoLogin()
        }
    }
    
    static let shared:RootAuthenticationProvider = RootAuthentication()
    
    var authState = CurrentValueSubject<AuthStatus, Never>(.loading)
    
    func autoLogin() async {
        if Auth.auth().currentUser==nil{
            authState.send(.loggedOut)
        }else{
            if let cachedUser = UserCache.load() {
                authState.send(.loggedIn(cachedUser))
                print("cachedUser.username\(cachedUser.username)")
            }
            
                await fetchUserFromDatabase()
            }
        
    }
    
    
    func fetchUserFromDatabase()async{
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        
        Database.database().reference().child("users").child(uid).observe(.value) {[weak self] snapshot in
            
            guard let  userDict = snapshot.value as? [String:Any] else{return}
            let currentUser = UserModel(dictionary: userDict)
            self?.authState.send(.loggedIn(currentUser))
            UserCache.save(currentUser)
            print("The current logged in user is \(currentUser.username)")
        
        } withCancel: {error in
            print("This error has occurred \(error.localizedDescription)")
        }

        
    }
    
    
    
}


extension RootAuthentication{
    

}
