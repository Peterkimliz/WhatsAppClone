//
//  ChatTextInputArea.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//
import SwiftUI

struct ChatTextInputArea:View{
    
    @State private var chatMessage:String = ""
    
    var body:some View{
        
        HStack(alignment: .bottom,spacing: 5) {
            
            Button {
            
            } label: {
                Image(systemName: "photo.on.rectangle")
                    .foregroundStyle(.black)
                    .font(.system(size:35))
            }

            chatInputsButton(fileName: "microphone.fill",isDisabled: chatMessage.isEmpty ? false : true)
            
            TextField("Message", text: $chatMessage, axis: .vertical)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 10).fill(.thinMaterial))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4),lineWidth: 1))
            
            chatInputsButton(fileName: "arrow.up",isDisabled: chatMessage.isEmpty ? true : false)

            
            
            
        }.padding(10)
        
    }
    
    
    fileprivate func chatInputsButton(fileName:String, isDisabled:Bool = true) ->some View{
        return Button {
            
        } label: {
            Image(systemName: fileName)
                .imageScale(.small)
                .fontWeight(.heavy)
                .padding(12)
                .foregroundStyle(.white)
                .background(isDisabled ? .gray : .blue)
                .clipShape(Circle())
        }.disabled(isDisabled)
    }
    
}





#Preview {
    ChatTextInputArea()
}
