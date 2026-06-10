//
//  CommonModifiers.swift
//  WhatsAppClone
//
//  Created by Apple on 09/06/2026.
//

import SwiftUI



struct BubbleTailModifier: ViewModifier{
    var direction:MessageDirection
    
    func body(content:Content)->some View{
        content.overlay(alignment: direction == .received ? .bottomLeading : .bottomTrailing) {
            TextBubbleTail(directin: direction)
        }
    }
    
}


extension View{
    
    func applyTrailing(direction:MessageDirection)->some View{
        modifier(BubbleTailModifier(direction: direction))
        
    }
    
    
}
