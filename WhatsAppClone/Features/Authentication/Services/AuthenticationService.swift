//
//  AuthenticationService.swift
//  WhatsAppClone
//
//  Created by Apple on 18/06/2026.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import Combine



enum AuthError:LocalizedError{
    case failedToCreateUser(message:String)
    case failedToLoginUser(message:String)
    case failedToSaveUser(message:String)
    
    var errorDescription: String?{
        switch self {
        case .failedToCreateUser(let message):
            return message
        case .failedToLoginUser(let message):
            return message
        case .failedToSaveUser(let message):
            return message
        }
    }
}

protocol AuthenticationProvider{
    static var shared:AuthenticationProvider{ get }
  
    func createUser(for username:String, with email:String ,and password:String ) async throws
    func loginUser(with email:String ,and password:String ) async throws
    func logout( ) async
 
    
    
}

final class AuthenticationService: AuthenticationProvider{
    
    private init(){}
    static let shared:  AuthenticationProvider = AuthenticationService()
    
    
    func createUser(for username: String, with email: String, and password: String) async throws {
        do{
           let authResponse = try await Auth.auth().createUser(withEmail: email, password: password)
           let uid = authResponse.user.uid
           let user = UserModel(uid: uid, email: email, username: username)
           try await saveUserToDatabase(user: user)
           UserCache.save(user)
           RootAuthentication.shared.authState.send(.loggedIn(user))
        
        }catch{
            throw AuthError.failedToCreateUser(message: error.localizedDescription)
            
        }
        
    }
    
    func loginUser(with email: String, and password: String) async throws {
        do{
            try await Auth.auth().signIn(withEmail: email, password: password)
            
            await RootAuthentication.shared.fetchUserFromDatabase()
        }catch{
            throw AuthError.failedToLoginUser(message: error.localizedDescription)
        }
        
    }
    
    func logout() async {
    
        try? Auth.auth().signOut()
        UserCache.clear()
        RootAuthentication.shared.authState.send(.loggedOut)
       
        
    }
    
   
    

}

extension AuthenticationService{
    
    func saveUserToDatabase(user:UserModel)async throws{
        do{
            let userDict = [
                "uid":user.uid,
                "email":user.email,
                "bio":user.bio,
                "username":user.username,
                "profileImageUrl":user.profileImageUrl
            ]
            try await  Database.database().reference().child("users").child(user.uid).setValue(userDict)
            
        }catch{
            throw AuthError.failedToSaveUser(message: error.localizedDescription)
        }
    }
    
}
