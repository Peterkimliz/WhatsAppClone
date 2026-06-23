//
//  ImageBubbleView.swift
//  WhatsAppClone
//  Created by Apple on 10/06/2026.
//

import SwiftUI

struct ImageBubbleView: View {
    let message:MessageItem
    
    var body: some View {
        HStack {
            
            if(message.direction == .sent){Spacer()}
            
            if(message.direction == .sent){forwarButton()}
               imageView()
            if(message.direction == .received){forwarButton()}
            if(message.direction == .received){Spacer()}
            
            
        }
    }
    
    
    
    private func  imageView()->some View{
        VStack(alignment: message.direction == .sent ? .leading : .trailing ,spacing: 3){
            Image(.stubImage0)
                .resizable()
                .frame(width: 200,height: 180)
                .scaledToFill()
//                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    Image(systemName:"play.fill" )
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.gray)
                        .clipShape(Circle())
                        .opacity(message.type == .video ? 1 : 0)
                }
            
            Text(message.message)
                .font(.footnote)
                .padding(.vertical,1)
        }
        .padding(5)
        .background(message.bgMessage)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal,3)
        .padding(.vertical,3)
        .offset(y:2)
        .applyTrailing(direction: message.direction)
        .padding(10)
    }
    
    
    
    func forwarButton()->some View{
        Button{
            
        }
        label:{
            Image(systemName: "arrowshape.turn.up.right.fill")
            .foregroundStyle(.white)
            .padding(10)
            .background(.gray)
           
            .clipShape(Circle())
        }
    
    }
    
}

#Preview {
  ScrollView{
        ImageBubbleView(message: .messageItems[2])
        ImageBubbleView(message: .messageItems[3])
  }.frame(maxWidth: .infinity)
        .background(.gray.opacity(0.4))
}
