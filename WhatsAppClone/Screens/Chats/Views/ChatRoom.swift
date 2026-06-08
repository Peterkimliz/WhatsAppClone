//
//  ChatRoom.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct ChatRoom: View {
    var body: some View {
        ZStack {
            
            Image(.chatbackground)
                .resizable()
            
        }
        .toolbarVisibility(.hidden, for:.tabBar)
        .toolbar {
            toolbarUserDetails()
            toolBarTrailingItems()
            
        }
        .safeAreaInset(edge: .bottom) {
            ChatTextInputArea()
        }
        
    }
}


extension ChatRoom{
    
    
    @ToolbarContentBuilder
    private func toolbarUserDetails()-> some ToolbarContent{
        
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                Circle()
                    .frame(width: 35,height: 35)
                
                Text("Qatester1")
                    .foregroundStyle(.black)
                    .bold()
            }.frame(maxWidth: .infinity)
        }.sharedBackgroundVisibility(.hidden)
        
        
    }
    
    
    
    @ToolbarContentBuilder
    private func toolBarTrailingItems()->some ToolbarContent{
        
        ToolbarItemGroup (placement: .topBarTrailing){
            
            Button {
                
            } label: {
                Image(systemName: "video")
            }

            Button {
                
            } label: {
                Image(systemName: "phone")
            }

           
            
        }.sharedBackgroundVisibility(.hidden)
    }
    
}






#Preview {
    NavigationStack{
        ChatRoom()

    }
  
}
