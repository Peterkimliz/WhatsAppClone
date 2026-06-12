//
//  AuthService.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import Combine




enum AuthState{
    case pending , loggedIn, loggedOut
}

protocol AuthProvider{
    static var shared:AuthProvider{ get  }
    var authState:CurrentValueSubject<AuthState,Never>{get}

    func autoLogin() async
    func signIn(email:String, password:String) async throws
    func signUp(name:String, email:String, password:String) async throws
    
}





final  class AuthService : AuthProvider{
    
    private init(){
        
    }
    
    static let shared:AuthProvider = AuthService()
    
    var authState = CurrentValueSubject<AuthState, Never>(.pending)
    

    func autoLogin() async {
    }
    

    
    
    func signIn(email: String, password: String) async throws {
     
        
        
    }
    
    
    
    func signUp(name: String, email: String, password: String) async throws {
        let result =  try await Auth.auth().createUser(withEmail: email, password:password)
        let id = result.user.uid
        let newUser = UserItem(uid: id, username:name, email: email)
        try await saveUserToFirestore(user: newUser)
        
    }
    
    
}


extension AuthService{
    
    private func saveUserToFirestore(user:UserItem)async throws{
        let userData = ["uid":user.id, "email":user.email,"username":user.username, " ":user.bioUrwrapped]
        try await Database.database().reference().child("users").child(user.id).setValue(userData)
        
        
        
    }
}
