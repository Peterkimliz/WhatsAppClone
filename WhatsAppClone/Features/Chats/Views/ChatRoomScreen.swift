//
//  ChatRoom.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.

import SwiftUI
struct ChatRoomScreen: View {
    var body: some View {
        ZStack {
            Image(.chatbackground)
                .resizable()
            
            ScrollView{
                ForEach(MessageItem.messageItems) { item in
                    
                    if(item.type == .text){
                        TextBubbleView(message: item)
                    }
                    else if(item.type == .audio){
                       AudioBubbleView(message: item)
                    }
                    
                    else{
                        ImageBubbleView(message: item)
                    }
                    
                }
                
            }.padding(.horizontal, 8)
            .padding(.bottom, 8)
            
        }
        .toolbarVisibility(.hidden, for:.tabBar)
        .toolbar {
            toolbarUserDetails()
            toolBarTrailingItems()
            
        }
        .safeAreaInset(edge: .bottom) {
            ChatTextInputAreaView()
        }
        
    }
}


extension ChatRoomScreen{
    
    
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
        ChatRoomScreen()

    }
  
}
