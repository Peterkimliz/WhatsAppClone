//
//  AudioBubleView.swift
//  WhatsAppClone
//
//  Created by Apple on 10/06/2026.
//

import SwiftUI

struct AudioBubbleView: View {
    let message:MessageItem
    @State private  var initialValue:Double = 0
    @State private var sliderRange:ClosedRange<Double> = 0...20
    var body: some View {
        VStack {
            HStack {
                playButton()
                Slider(value: $initialValue, in: sliderRange)
                    .tint(.gray)
                Text("00:05")
                  .foregroundStyle(.gray)
                
            }.padding(10)
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                
            
            Text("5:00 PM")
                .frame(maxWidth: .infinity,alignment: message.alignment)
                .foregroundStyle(.gray)
            }.padding(8)
            .background(message.bgMessage)
           .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal,3)
            .padding(.vertical,3)
            .offset(y:2)
            .applyTrailing(direction: message.direction)
            .frame(maxWidth: .infinity,alignment: message.alignment)
            .padding(.leading, message.direction == .received ? 5: 95)
            .padding(.trailing, message.direction == .received ? 95: 5)
    }
    
    private func playButton()->some View{
        Button{
            
        }
        label:{
            Image(systemName: "play.fill")
                .padding(8)
                .foregroundStyle(message.direction == .received ? .white : .black)
                .background(message.direction == .received ? .green : .white)
                .clipShape(Circle())
        }
    }
}

// MARK: - Preview Timer Helper
private struct PreviewTimerView: View {
    let startTime = Date()

    var body: some View {
        VStack(spacing: 0) {
            // ⏱ Timer badge
            Text("⏱ Rendered at: \(startTime.formatted(date: .omitted, time: .standard))")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
                .padding(.top, 10)

            ScrollView {
                AudioBubbleView(message: MessageItem.messageItems[4])
                    .padding()
                AudioBubbleView(message: MessageItem.messageItems[5])
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.3))
        }
    }
}

#Preview {
    PreviewTimerView()
}
