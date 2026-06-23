//
//  SignInScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI

struct SignInScreen: View {
    @Environment(AuthViewModel.self) private var authVm
    
    var body: some View {
        @Bindable var authBindable = authVm
        
        NavigationStack{
            VStack(spacing: 15){
                TextFormField(
                    value: $authBindable.txtLoginEmail,
                    image: "envelope.fill",
                    placeholder: "Email",
                    keyBoardType: .emailAddress,
                    inputState: authBindable.emailLoginValid)
                  .padding(.top,10)
                  .padding(.bottom,10)
                
                  TextFormField(
                    value: $authBindable.txtLoginPassword,
                    image: "lock.fill",
                    placeholder: "Password",
                    isSecure: true,
                    inputState: authBindable.passwordLoginValid)
                
                
                NavigationLink {
                    ForgotPasswordScreen()
                } label: {
                    NavLink(title: "Forgot", subTitle: "Password?")
                }

                
                Button {
                    Task{
                       await authBindable.handleLogin()
                    }
                } label: {
                    Text("Sign In")
                        .buttonTextModifier(bgColor:authBindable.isLoginValid ? .black : .gray.opacity(0.3))
                       
                }.disabled(authBindable.isLoginValid ? false : true)
                
                
               Spacer()
                
                
                
                NavigationLink {
                    SignUpScreen()
                } label: {
                    NavLink(title: "Dont have Account?", subTitle: "Sign Up",alignment: .center)
                }
                
                
            }
           
            .padding(.horizontal,10)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .navigationTitle("Sign In")
            .showLoading(isLoading: authBindable.isSigningIn, message: "Signing in")
            .alert("Login Error ", isPresented: $authBindable.autherror.showError,){
                Button(role:.close) {
                    
                }
            }message: {
                Text(authBindable.autherror.message)
            }
        
        }
    }
}

#Preview {
    struct SignInScreenWrapper:View{
        @State private var authVm:AuthViewModel=AuthViewModel()
        
        var body: some View{
            SignInScreen()
        }
        
    }
    
    return SignInScreenWrapper()
   
}
