//
//  ChatsViewModel.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//

import SwiftUI
import FirebaseAuth
enum  ChannelPatnerCreationRoute: Hashable {
  case groupPatnerPicker
  case createChannel
    
}


@Observable
final class ChatsViewModel{
    var navStack = [ChannelPatnerCreationRoute]()
    private(set)var selectedGroupUsers = [UserModel]()
    private(set) var users = [UserModel]()
    private  var lastCursor:String? = nil
    var navigateToChatRoom:Bool = false
    var isPaginatable:Bool{ return !users.isEmpty }
    
    init(){
        Task{
            await fetchUsers()
        }
    }
    
    
    func showUsersSelecte()->Bool{ return !selectedGroupUsers.isEmpty}
    
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
    
    func disableButton()->Bool{
      return selectedGroupUsers.isEmpty
    }
    
    
    
    func fetchUsers()async{
        do{
            print("💾Iam Called here")
            let userResponse = try await UserService.shared.fetchPaginatedUsers(lastCursor: lastCursor, pageSize: 5)
            var filteredUsers = userResponse.users
            guard let uid = Auth.auth().currentUser?.uid else{return}
            filteredUsers = filteredUsers.filter{ $0.uid != uid}
            self.users.append(contentsOf:filteredUsers)
            self.lastCursor = userResponse.currentCursor
            print("Last cursor is\(String(describing: userResponse.currentCursor))")
            
        }catch{
            print("Error fetching users\(error.localizedDescription)")
        }
        
    }
    
    func createDirectChannel() async {
        
    }
    
    
    
    
    
    
}
