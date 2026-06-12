//
//  CommonModifiers.swift
//  WhatsAppClone
//
//  Created by Apple on 09/06/2026.
//

import SwiftUI



private struct BubbleTailModifier: ViewModifier{
    var direction:MessageDirection
    
    func body(content:Content)->some View{
        content.overlay(alignment: direction == .received ? .bottomLeading : .bottomTrailing) {
            TextBubbleTail(directin: direction)
        }
    }
    
}



private struct ButtonTextModifier:ViewModifier{
    var bgColor:Color
    var fgColor:Color
    
    
    func body(content:Content)->some View{
        content
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundStyle(fgColor)
            .font(.system(size: 20))
            .bold()
            .padding(10)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        
        
    }
}



private struct ShowLoading:ViewModifier{
    let isLoading:Bool
    let message:String
    func body(content: Content) -> some View {
        if(isLoading){
          ProgressView(message)
            
        }else{
            content
        }
        
    }
    
}

extension View{
    
    func applyTrailing(direction:MessageDirection)->some View{
        modifier(BubbleTailModifier(direction: direction))
        
    }
    
    func buttonTextModifier(bgColor:Color = .black, fgColor:Color = .white)->some View{
        modifier(ButtonTextModifier(bgColor:bgColor, fgColor:fgColor ))
    }
    
    func showLoading(isLoading:Bool, message:String)->some View{
        
        modifier(ShowLoading(isLoading: isLoading, message: message))
    }
    
    
}
