//
//  SelectedChatPartner.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//

import SwiftUI

struct SelectedChatPartner: View {
    let users:[UserModel]
    var cancelButtonTap:(UserModel)->Void
    var body: some View {
        
        ScrollView(.horizontal) {
            
            HStack {
                ForEach(users) {user in
                    
                    VStack{
                        Circle()
                            .frame(width: 60,height: 60)
                            .foregroundStyle(Color(.systemGray))
                            .overlay(alignment: .topTrailing) {
                                cancelButton(user: user)
                            }
                        
                        Text(user.username.capitalized)
                            .font(.caption)
                            .bold()
                    }
                }
            }
            
        }.scrollIndicators(.hidden)
        
        
    }
    
    
    private func cancelButton(user:UserModel)->some View{
        Button {
            cancelButtonTap(user)
        } label: {
            Image(systemName: "xmark")
                .imageScale(.small)
                .bold()
                .foregroundStyle(.white)
                .padding(8)
                .background(Color(.systemGray4))
                .clipShape(Circle())
        }

        
    }
    
    
    
}

#Preview {
    SelectedChatPartner(users:UserModel.dummyUsers){ user in
        
    }
}
