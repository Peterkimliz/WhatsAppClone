//
//  ChatItem.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//
import SwiftUI
struct ChatUserItemView<displayItem: View>:View{
    private var user:UserModel
    private let trailingItem:displayItem
    
    
    
    init(user: UserModel, trailingItem:()->displayItem = {EmptyView()}) {
        self.user = user
        self.trailingItem = trailingItem()
    }
  
    
    
    var body:some View{
        HStack {
            Circle()
                .frame(width: 50,height: 50)
                .foregroundStyle(Color(.systemGray))
            
                VStack(alignment: .leading){
                Text(user.username)
                    .foregroundStyle(.whatsAppBlack)
                    .bold()
                
                Text(user.bioUnwraapped)
                    .font(.callout)
                    .foregroundStyle(Color(.systemGray))
                    .lineLimit(1)
                
            }
            Spacer()
            
            trailingItem
        }
    }
}

#Preview {
    ChatUserItemView(user: UserModel.dummyUsers[0]) {
        Image(systemName: "checkmark")
    }
}
