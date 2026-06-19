//
//  AuthViewModel.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI

@Observable
class AuthViewModel{
    

    var emailLoginValid : TextInputFieldsState = .empty
    var passwordLoginValid : TextInputFieldsState = .empty
    
    
    var nameRegisterValid : TextInputFieldsState = .empty
    var emailRegisterValid : TextInputFieldsState = .empty
    var passwordRegisterValid : TextInputFieldsState = .empty
    
    var isLoginValid:Bool = false
    var isRegisterValid:Bool = false
    var isRegisterestering:Bool = false
    var isSigningIn:Bool = false
    
    var autherror:(message:String, showError:Bool) = ("", false)
    
    
    
    
    var txtLoginEmail : String = "" {
        didSet{
            emailLoginValid = txtLoginEmail.isEmpty ? .empty : !txtLoginEmail.contains("@") ? .invalid : .valid
            isLoginDetailsValid()
        }
    }
    
    var txtLoginPassword : String = "" {
        didSet{
            passwordLoginValid = txtLoginPassword.isEmpty ? .empty : txtLoginPassword.count < 6 ? .invalid : .valid
            isLoginDetailsValid()
        }
    }
    
    
    private func isLoginDetailsValid(){
        isLoginValid =  emailLoginValid == .valid && passwordLoginValid == .valid
    }
    
    
    var txtRegisterName: String = "" {
        didSet{
            nameRegisterValid = txtRegisterName.isEmpty ? .empty : txtRegisterName.count < 5 ? .invalid : .valid
            isRegisterDetailsValid()
        }
    }
    
    var txtRegisterEmail : String = "" {
        didSet{
            emailRegisterValid = txtRegisterEmail.isEmpty ? .empty : !txtRegisterEmail.contains("@") ? .invalid : .valid
            isRegisterDetailsValid()
        }
    }
    
    var txtRegisterPassword : String = "" {
        didSet{
            passwordRegisterValid = txtRegisterPassword.isEmpty ? .empty : txtRegisterPassword.count < 6 ? .invalid : .valid
            isRegisterDetailsValid()
        }
    }
    
    
    private func isRegisterDetailsValid(){
        isRegisterValid =  emailRegisterValid == .valid && passwordRegisterValid == .valid  && nameRegisterValid == .valid
    }
    
    
    
    
    func handleLogin()async{
        isSigningIn = true
        defer{
            isSigningIn = false
        }
        
        do{
            try await  AuthenticationService.shared.loginUser(with: txtLoginEmail, and: txtLoginPassword)
            print("Iam logging in")
            txtLoginEmail = ""
            txtLoginPassword = ""
            
        }catch{
            autherror.showError = true
            autherror.message = error.localizedDescription
            print("Error Occurred \(error.localizedDescription)")
        }
        
    }
    
    func handleSignUp() async {
        isRegisterestering = true
        
        defer{
            isRegisterestering = false
        }
        
        do{
            try await AuthenticationService.shared.createUser(for: txtRegisterName, with: txtRegisterEmail, and: txtRegisterPassword)
           print("The result is")
            txtRegisterName = ""
            txtRegisterPassword = ""
            txtRegisterEmail = ""
            
        } catch{
            autherror.showError = true
            autherror.message = error.localizedDescription
            print("Error Occurred \(error.localizedDescription)")
        }
    }
    
    func handleLogout()async{
        await AuthenticationService.shared.logout()
    }
    
    
    
    
}
