//
//  RootView.swift
//  WhatsAppClone
//
//  Created by Apple on 18/06/2026.
//

import SwiftUI

struct RootView: View {
    @State private var rootVm:RootViewModel=RootViewModel()
    @State private var authVm = AuthViewModel()
    
    var body: some View {
        VStack{
            switch rootVm.authState {
            case .loading:
                ProgressView()
                    .controlSize(.large)
            case .loggedIn(let userModel):
                MainTabView(user: userModel)
            case .loggedOut:
                SignInScreen()
            }
        }.environment(authVm)
        
      
    }
}

