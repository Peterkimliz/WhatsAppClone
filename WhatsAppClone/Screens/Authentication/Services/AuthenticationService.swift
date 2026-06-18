//
//  AuthenticationService.swift
//  WhatsAppClone
//
//  Created by Apple on 18/06/2026.
//

import SwiftUI
import Combine
import FirebaseAuth
import FirebaseDatabase

enum AuthStatus{
    case loading
    case loggedIn(UserModel)
    case loggedOut
}

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
    var authState:CurrentValueSubject<AuthStatus,Never>{get}
    
    func createUser(for username:String, with email:String ,and password:String ) async throws
    func loginUser(with email:String ,and password:String ) async throws
    func logout( ) async
    func autoLogin()async
    
    
}

final class AuthenticationService: AuthenticationProvider{
    
    private init(){
        Task{
           await autoLogin()
        }
    }
    static let shared:  AuthenticationProvider = AuthenticationService()
    
    let authState = CurrentValueSubject<AuthStatus, Never>(.loading)
    
    func createUser(for username: String, with email: String, and password: String) async throws {
        do{
           let authResponse = try await Auth.auth().createUser(withEmail: email, password: password)
           let uid = authResponse.user.uid
           let user = UserModel(uid: uid, email: email, username: username)
           try await saveUserToDatabase(user: user)
            
            
        }catch{
            throw AuthError.failedToCreateUser(message: error.localizedDescription)
            
        }
        
    }
    
    func loginUser(with email: String, and password: String) async throws {
        do{
            try await Auth.auth().signIn(withEmail: email, password: password)
            fetchUserFromDatabase()
        }catch{
            throw AuthError.failedToLoginUser(message: error.localizedDescription)
        }
        
    }
    
    func logout() async {
        
        
    }
    
    func autoLogin() async {
        if Auth.auth().currentUser==nil{
            authState.send(.loggedOut)
        }else{
            fetchUserFromDatabase()
        }
        
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
    
    
    func fetchUserFromDatabase(){
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        
        Database.database().reference().child("users").child(uid).observe(.value) {[weak self] snapshot in
            
            guard let  userDict = snapshot.value as? [String:Any] else{return}
            let currentUser = UserModel(dictionary: userDict)
            self?.authState.send(.loggedIn(currentUser))
        
        } withCancel: {error in
            print("This error has occurred \(error.localizedDescription)")
        }

        
    }
    
    
    
}
