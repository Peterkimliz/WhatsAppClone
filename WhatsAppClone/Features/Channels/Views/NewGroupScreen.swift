//
//  NewGroupScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//

import SwiftUI

struct NewGroupScreen: View {
    @State private var searchText:String = ""
    @State var chatVm:ChatsViewModel
    @State private var name:String = ""
    var body: some View {
        List{
            
            Section{
                
                HStack{
                    Button{
                        
                    }
                    label:{
                        ZStack{
                            Image(systemName: "camera.fill")
                                .imageScale(.large)
                        }.frame(width: 60,height: 50)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                    }
                    
                       TextField(
                        "",
                        text: $name,
                        prompt: Text("Group Name"),
                        axis: .vertical,
                    )
                    
                }
                
            }
            Section{
                Text("Disappearing Messages")
                Text("Group Permissions")
                
            }
            Section{
                SelectedChatPartner(users: chatVm.selectedGroupUsers) { item in
                    chatVm.handleItemSelection(user: item)
                }
            }header: {
                Text("Participants \(chatVm.selectedGroupUsers.count) of 12")
                    .bold()
            }.listRowBackground(Color.clear)
        }.navigationTitle("New Group")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            createButton()
        }
        
    }
}

extension NewGroupScreen{
    
    @ToolbarContentBuilder
    private func createButton()->some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                
            } label: {
                Text("Create")
            }.disabled(chatVm.disableButton())

        }
        .sharedBackgroundVisibility(.hidden)
        
    }
    
}


#Preview {
    NavigationStack{
        NewGroupScreen(chatVm: ChatsViewModel())
    }
}
