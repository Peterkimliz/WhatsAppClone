//
//  ChatsViewModel.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//

import SwiftUI

enum  ChannelPatnerCreationRoute: Hashable {
  case groupPatnerPicker
  case createChannel
    
}


@Observable
final class ChatsViewModel{
    var navStack = [ChannelPatnerCreationRoute]()
    
    private(set)var selectedGroupUsers = [UserModel]()
    
    func showUsersSelecte()->Bool{
        return !selectedGroupUsers.isEmpty
    }
    
    func handleItemSelection(user:UserModel){
        
        if checkUserIsPresent(user: user){
            guard let  index = selectedGroupUsers.firstIndex(where: { $0.id == user.id}) else{ return}
            selectedGroupUsers.remove(at: index)
        }else{
            selectedGroupUsers.append(user)
        }
        
    }
    
    
    
     func checkUserIsPresent(user:UserModel)->Bool{
    
        return selectedGroupUsers.contains { item in item.id == user.id}
    }
    
    
}
