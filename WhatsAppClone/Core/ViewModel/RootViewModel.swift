//
//  RootViewModel.swift
//  WhatsAppClone
//
//  Created by Apple on 18/06/2026.
//

import SwiftUI
import Combine
@Observable
final class RootViewModel{
    
    var cancelable:AnyCancellable?
    
     init(){
        
      cancelable = RootAuthentication.shared.authState.receive(on: DispatchQueue.main)
            .sink {[weak self]latestState in
                self?.authState = latestState
        }

        
    }
    var authState:AuthStatus = AuthStatus.loading
    
    
    
    
    
}
