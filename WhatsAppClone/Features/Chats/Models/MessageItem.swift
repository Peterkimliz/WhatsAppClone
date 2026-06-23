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
    let type:MessageType
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
    
    static var sentPlaceHolder = MessageItem(
        message: "Hello John how are you doing this morning , hope you are still aware that we have a swift meetup this very afternoon",
        type:.text,
        direction: .sent
    )
    
    static var receivesPlaceHolder = MessageItem(
        message: "Hello to Peter, yes iam still aware about the meeting",
        type: .text,
        direction: .received
    )
    
    static var messageItems:[MessageItem]=[
        sentPlaceHolder,
        receivesPlaceHolder,
        
        MessageItem(
            message: "Check this image",
            type: .photo,
            direction: .sent
        ),
        
        MessageItem(
            message: "Check this video",
            type: .video,
            direction: .received
        ),
        MessageItem(
            message: "Play Audio",
            type: .audio,
            direction: .received
        ) ,
        MessageItem(
            message: "Play Audio",
            type: .audio,
            direction: .sent
        )
        
    ]
    
    
    
    
    
    
}
enum MessageType{
    case text, photo, video,audio
}

enum MessageDirection{
    case sent
    case received
}
