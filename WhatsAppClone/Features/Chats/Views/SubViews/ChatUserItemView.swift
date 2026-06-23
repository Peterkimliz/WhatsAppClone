//
//  ChatItem.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//
import SwiftUI
struct ChatUserItemView:View{
    
    var body:some View{
        HStack {
            Circle()
                .frame(width: 50,height: 50)
            VStack(alignment: .leading){
                Text("Qatester")
                    .bold()
                
                Text("Hi there! iam using Whatsapp")
                    .font(.callout)
                    .foregroundStyle(Color(.systemGray))
                    .lineLimit(1)
                
            }
        }
    }
}

#Preview {
    ChatUserItemView()
}
