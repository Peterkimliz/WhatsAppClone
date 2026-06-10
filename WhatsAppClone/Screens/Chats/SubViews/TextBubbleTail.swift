//
//  BubbleMessageTail.swift
//  WhatsAppClone
//
//  Created by Apple on 09/06/2026.
//

import SwiftUI

struct TextBubbleTail: View {
    var directin:MessageDirection
    
    var body: some View {
        
        var background : Color {
            switch directin {
            case .sent:
                .bubbleGreen
            case .received:
                .bubbleWhite
            }
        }
        
        Image(directin == .received ? .incomingTail : .outgoingTail)
            .resizable()
            .renderingMode(.template)
            .frame(width: 10,height: 10)
            .foregroundStyle(background)
           
        
    }
}

#Preview {
    ScrollView{
        TextBubbleTail(directin: .sent)
        TextBubbleTail(directin: .received)
    }
    .frame(maxWidth: .infinity)
    .background(.gray)
}
