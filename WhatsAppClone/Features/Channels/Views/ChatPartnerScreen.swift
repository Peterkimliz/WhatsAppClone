//
//  ChatOptionsScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 19/06/2026.
//

import SwiftUI

struct ChatPartnerScreen: View {
    @Environment(\.dismiss) private var dismiss
    var chatViewModel:ChatsViewModel
    @State private var searchString:String = ""
    var onCreateNewChannel:(_ newChannel: ChannelItem)->Void
    
    var body: some View {
        @Bindable var chatVm = chatViewModel
        NavigationStack(path:$chatVm.navStack){
            List {
                ForEach(ChatPartnerOption.allCases) { item in
                    Button{
                           switch item {
                           case .newGroup:
                               chatViewModel
                                   .navStack
                                   .append(ChannelPatnerCreationRoute.groupPatnerPicker)
                               return
                           case .newChat:
                               return
                           case .newCommmunity:
                               return
                           }
                           
                       }
                    
                    label:{
                        chatOptionHeader(item: item)
                    }
                        
        
                }
                
                Section {
                    
                    ForEach(chatVm.users) { item in
                        Button {
                            chatViewModel.handleItemSelection(user: item)
                            let createChannel = chatViewModel.createChannel(nil,isGroupChat: false)
                            switch createChannel {
                            case .success(let data):
                                onCreateNewChannel(data)
                            case .failure(let error):
                                print("Failed to create channel\(error)")
                            }
                           
                        } label: {
                            ChatUserItemView(user:item)
                        }
                    }
                    
                }header: {
                    Text("Contacts on Whatsapp")
                        .bold()
                }
                
                if(chatVm.isPaginatable){
                    loadMoreUsers()
                }

            }.navigationTitle("New Chat")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: ChannelPatnerCreationRoute.self, destination: { route in
               
                switch route{
                case .groupPatnerPicker:
                    GroupPartnerPickerScreen(chatVm: chatVm)
                case .createChannel:
                    NewGroupScreen(chatVm: chatVm, oncreate:chatVm.onNewChannelCreation)
                }
                
            })
            .searchable(text: $searchString, placement:.navigationBarDrawer,prompt: "Search name or number ")
             .toolbar {
                 cancelButton()
                }
        }
    }
    
    
    private func loadMoreUsers()->some View{
        ProgressView()
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.clear)
            .task {
                await chatViewModel.fetchUsers()
            }
    }
}


extension ChatPartnerScreen{
    
    
    
    
    private enum ChatPartnerOption:String ,Identifiable,CaseIterable{
        
        case newGroup = "New Group"
        case newChat = "New Chat"
        case newCommmunity = "New Community"
        
        var id:String{
            return rawValue
        }
        
        var title:String{
            rawValue
        }
        
        var imageName:String{
            switch self {
            case .newGroup:
                return "person.2.fill"
            case .newChat:
                return "person.fill.badge.plus"
            case .newCommmunity:
                return "person.3.fill"
            }
        }
        
        
    }
    
    
    @ToolbarContentBuilder
    private func cancelButton()->some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.footnote)
                    .padding(10)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
            }

        }.sharedBackgroundVisibility(.hidden)
    }
    
    
    private func chatOptionHeader(item:ChatPartnerOption)->some View{
       
            
            HStack{
                Image(systemName: item.imageName)
                    .imageScale(.small)
                    .padding(8)
                    .frame(width: 40,height: 40)
                    .foregroundStyle(.whatsAppBlack)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
            
                    Text(item.title)
                    .foregroundStyle(.whatsAppBlack)

            }
          
        

       
    }
    
    
}




#Preview {
    ChatPartnerScreen(chatViewModel: ChatsViewModel()){ch in
     }
    

}
