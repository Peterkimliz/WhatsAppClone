//
//  SignUpScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AuthViewModel.self) private var authVm
  var body: some View {
      @Bindable var authBindable = authVm
      
      NavigationStack{
          VStack(spacing: 15){
              TextFormField(
                value: $authBindable.txtRegisterName,
                        image: "person.fill",
                        placeholder: "Username",
                inputState: authBindable.nameRegisterValid)
                       .padding(.top,10)
                       .padding(.bottom,10)
                    
               TextFormField(
                value: $authBindable.txtRegisterEmail,
                        image: "envelope.fill",
                        placeholder: "Email",
                        keyBoardType: .emailAddress,
                inputState: authBindable.emailRegisterValid)
                      .padding(.bottom,10)
                    
             TextFormField(
                value: $authBindable.txtRegisterPassword,
                        image: "lock.fill",
                        placeholder: "Password",
                        isSecure: true,
                inputState: authBindable.passwordRegisterValid)
             .padding(.bottom,30)
                    
                    
                    
              Button {
                  
                  Task{
                      await authBindable.handleSignUp()
                  }
                        
                    } label: {
                        Text("Sign Up")
                            .buttonTextModifier( bgColor: authBindable.isRegisterValid ? .black : .gray.opacity(0.3))
                    }.disabled(authBindable.isRegisterValid ? false : true )
                    
                    
                    
                   Spacer()
              Button {
                  dismiss()
              } label: {
                  NavLink(title: "Already have an Account?", subTitle: "Sign In",alignment: .center)
              }

                }.padding(.horizontal,10)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .navigationTitle("Sign Up")
                .showLoading(isLoading: authBindable.isRegisterestering, message: "Creating Account...")
                 
                .navigationBarBackButtonHidden()
            
            }
        }
}

#Preview {
    
 struct  SignUpScreenWrapper:View{
        @State var authVm = AuthViewModel()
        var body: some View{
            SignUpScreen()
                .environment(authVm)
            
        }
    }
    
    return SignUpScreenWrapper()
    
//
}
