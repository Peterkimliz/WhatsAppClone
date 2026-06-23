//
//  TextBubbleView.swift
//  WhatsAppClone
//
//  Created by Apple on 09/06/2026.
//

import SwiftUI

struct TextBubbleView: View {
    let message:MessageItem
    var body: some View {
        VStack(alignment: message.horizonAlignment){
            Text(message.message)
             dateView()
            }.padding(5)
        
        .background(message.bgMessage)
        .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
        .padding(.horizontal,2)
        .padding(.vertical,2)
        .offset(y:2)
        .applyTrailing(direction: message.direction)
        .frame(maxWidth: .infinity,alignment: message.alignment)
        .shadow(color:Color(.systemGray6).opacity(0.3),radius: 2,x: 0,y: 1)
        .padding(.leading, message.direction == .received ? 10 : 100)
        .padding(.trailing, message.direction == .sent ? 10 : 100)
    }
    
    
    func dateView()->some View{
        Text("3:30 PM")
            .foregroundStyle(.gray)
    }
    
    
}

#Preview {
    ScrollView{
        TextBubbleView(message: .sentPlaceHolder)
        TextBubbleView(message: .receivesPlaceHolder)
    }
    .frame(maxWidth: .infinity)
    .background(.gray)
}
