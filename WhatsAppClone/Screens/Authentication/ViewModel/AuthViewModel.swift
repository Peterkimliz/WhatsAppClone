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
    
    
    
    
    func handleSignUp() async {
        isRegisterestering = true
        
        defer{
            isRegisterestering = false
        }
        
        do{
            let _ = try await AuthService.shared.signUp(name: txtRegisterName, email: txtRegisterEmail, password: txtRegisterPassword)
            print("The result is")
            
        }catch{
            print("Error Occurred \(error.localizedDescription)")
        }
    }
    
    
    
    
}
