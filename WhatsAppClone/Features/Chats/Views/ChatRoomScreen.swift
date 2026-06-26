//
//  ChatRoom.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.

import SwiftUI
struct ChatRoomScreen: View {
    let channel:ChannelItem
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
            HStack(spacing: 8) {
                Circle()
                    .fill(.gray.opacity(0.3))
                    .frame(width: 35, height: 35)

                Text(channel.title.capitalized)
                    .foregroundStyle(.black)
                    .bold()
                    .lineLimit(1)
            }
            .id(channel.id) // forces SwiftUI to treat this as a fresh view, not reuse a stale one
        }
        .sharedBackgroundVisibility(.hidden)
            .sharedBackgroundVisibility(.hidden)
        
        
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
        ChatRoomScreen(channel: .placeholder)

    }
  
}
