//
//  GroupPartnersPickerScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//


import SwiftUI

struct GroupPartnerPickerScreen: View {
    @State private var searchText:String = ""
    var chatVm:ChatsViewModel
    
    var body: some View {
        List{
            
            if(chatVm.showUsersSelecte()){
                SelectedChatPartner(users: chatVm.selectedGroupUsers) { user in
                    chatVm.handleItemSelection(user: user)
                }
            }
            
        
            Section{
                ForEach(UserModel.dummyUsers) { item in
                    Button{
                        chatVm.handleItemSelection(user: item)
                    }label:{
                        chatUserItemView(item: item)
                    }
                }
            }
            
        }
        .animation(.easeInOut, value: chatVm.showUsersSelecte())
        .searchable(text:$searchText,placement:.navigationBarDrawer(displayMode:.always))
        .toolbar {
            trailingButtonToolBar()
            titleToolBar()
        }
    }
    
    fileprivate func chatUserItemView(item: UserModel) -> some View{
         ChatUserItemView(user: item) {
            let isSelected = chatVm.checkUserIsPresent(user: item)
            let image = isSelected ?"checkmark.circle.fill":"circle"
            let color = isSelected ? Color.blue :Color(.systemGray)
            return  Image(systemName:image)
                 .foregroundStyle(color)
            
            
            
        }
    }
}

extension GroupPartnerPickerScreen{
    
    
    @ToolbarContentBuilder
    private func trailingButtonToolBar()->some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                chatVm.navStack.append(.createChannel)
            } label: {
                Text("Next")
                    .bold()
            } .bold()
            .disabled(!chatVm.showUsersSelecte())

        }.sharedBackgroundVisibility(.hidden)
        
    }  
    @ToolbarContentBuilder
    private func titleToolBar()->some ToolbarContent{
        ToolbarItem(placement: .principal) {
          VStack{
                Text("Add Paricipants")
                    .bold()
              let count = chatVm.selectedGroupUsers.count
              Text("\(count)/20")
                  .foregroundStyle(.secondary)
                  .font(.footnote)
            }

        }.sharedBackgroundVisibility(.hidden)
        
    }
    
}

#Preview {
    NavigationStack{
        GroupPartnerPickerScreen(chatVm:  ChatsViewModel())
    }
   
}

