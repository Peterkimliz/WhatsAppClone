//
//  SectionItemView.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct SettingItemView: View {
     var settingItem:SettingsModel
    var body: some View {
        
        HStack {
              imageView()
                .frame(width: 30,height: 30)
                .foregroundStyle(.white)
                .background(settingItem.bgColor)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Text(settingItem.title)
                .font(.system(size: 19))
                .bold()
            Spacer()
        }
        
    }
    
    @ViewBuilder
    private func imageView()->some View{
        switch settingItem.imageType {
        case .systemImage:
            Image(systemName: settingItem.image )
                .bold()
                .font(.callout)
        case .assetImage:
            Image(settingItem.image )
                .renderingMode(.template) .padding(3)
        }
        
     }
}

#Preview {
    SettingItemView(settingItem: .account)
}
