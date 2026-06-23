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
                ScrollView(.horizontal) {
                    HStack {}
                }
            }
            
        
            Section{
                ForEach(UserModel.dummyUsers) { item in
                    Button{
                        chatVm.addUser(user: item)
                    }label:{
                        chatUserItemView(item: item)
                    }
                }
            }
            
        }.searchable(text:$searchText,placement: .navigationBarDrawer)
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

#Preview {
    NavigationStack{
        GroupPartnerPickerScreen(chatVm:  ChatsViewModel())
    }
   
}

