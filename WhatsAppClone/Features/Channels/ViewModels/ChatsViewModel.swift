//
//  ChatsViewModel.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

enum  ChannelPatnerCreationRoute: Hashable {
  case groupPatnerPicker
  case createChannel
    
}

enum ChannelCreationError:Error{
    case noChatPartner
    case failedToCreateUniqueIds
    case failedToCreateChannel
}


@Observable
final class ChatsViewModel{
    var navStack = [ChannelPatnerCreationRoute]()
    private(set)var selectedGroupUsers = [UserModel]()
    private(set) var users = [UserModel]()
    private  var lastCursor:String? = nil
    var navigateToChatRoom:Bool = false
    var showModalSheet:Bool = false
    var newChannel:ChannelItem?
    
    
    var isPaginatable:Bool{ return !users.isEmpty }

    init(){
        Task{
            await fetchUsers()
        }
    }
    
    func onNewChannelCreation(_ channel:ChannelItem){
        self.newChannel = channel
        showModalSheet = false
        navigateToChatRoom = true
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
    
    
    func createChannel(_ channelName:String?, isGroupChat:Bool = true)->Result<ChannelItem,Error>{
       
             guard !selectedGroupUsers.isEmpty else{return .failure(ChannelCreationError.noChatPartner)}
             guard let channelId = FirebaseConstants.ChannelsRef.childByAutoId().key,
                   let currentUserId = Auth.auth().currentUser?.uid
             else{ return .failure(ChannelCreationError.failedToCreateUniqueIds) }
             
             let timeStamp = Date().timeIntervalSince1970
             var membersUid = selectedGroupUsers.compactMap{$0.uid}
             membersUid.append(currentUserId)
             
             var channelDict:[String: Any] = [
                 .id: channelId,
                 .creationDate:timeStamp,
                 .lastmessage:"",
                 .lastMessageTimeStamp: timeStamp,
                 .membersCount: membersUid.count,
                 .thumbnailUrl:"",
                 .adminsUids:[currentUserId],
                 .membersUids: membersUid,
                 .isGroupChat: isGroupChat
             ]
             
            if let channelName = channelName, !channelName.isEmptyOrWhiteSpace{
                channelDict[.name] = channelName
              }
            FirebaseConstants.ChannelsRef.child(channelId).setValue(channelDict)
            membersUid.forEach { userId in
                 FirebaseConstants.UserChannelsRef.child(userId).child(channelId).setValue(true )
                
             }
        if(isGroupChat==false){
            let chatPartnerId = selectedGroupUsers[0].id
            FirebaseConstants.UserDirectChannelsRef.child(currentUserId).child(chatPartnerId).setValue([channelId: true])
            FirebaseConstants.UserDirectChannelsRef.child(chatPartnerId).child(currentUserId).setValue([channelId: true])
        }
        
         var newChannelItem = ChannelItem(dict: channelDict)
        newChannelItem.members = selectedGroupUsers
        selectedGroupUsers.removeAll()
        return.success(newChannelItem)
             
         
        
        
         
    }
    
    
    
    
    
    
}
