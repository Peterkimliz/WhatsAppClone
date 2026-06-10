//
//  MessageItem.swift
//  WhatsAppClone
//
//  Created by Apple on 09/06/2026.
//

import SwiftUI

struct MessageItem: Identifiable{
    let id:UUID = UUID()
    let message:String
    let direction:MessageDirection
    
    var alignment:Alignment{
        switch direction {
        case .sent:
                .trailing
        case .received:
                .leading
        }
    }
    
    var horizonAlignment:HorizontalAlignment{
        switch direction {
        case .sent:
                .trailing
        case .received:
                .leading
        }
    }
    
    var  bgMessage:Color{
        switch direction {
        case .sent:
                .bubbleGreen
        case .received:
                .bubbleWhite
        }
    }
    
    static var sentPlaceHolder = MessageItem(message: "Hello John how are you doing this morning , hope you are still aware that we have a swift meetup this very afternoon", direction: .sent)
    static var receivesPlaceHolder = MessageItem(message: "Hello to Peter, yes iam still aware about the meeting", direction: .received)
    
}


enum MessageDirection{
    case sent
    case received
}
