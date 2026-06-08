//
//  SettingsTabScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var searchString:String  = ""
    var body: some View {
       NavigationStack {
           List{
               
               userDetails()
               Section{
                   SettingItemView(settingItem: .broadcastingList)
                   SettingItemView(settingItem: .starredMessage)
                   SettingItemView(settingItem: .linkedDevices)
                 
               }
               
               
               Section{
                   SettingItemView(settingItem: .account)
                   SettingItemView(settingItem: .privacy)
                   SettingItemView(settingItem: .chats)
                   SettingItemView(settingItem: .notifications)
                   SettingItemView(settingItem: .storageAndData)
                 
               }
               
               
               
               Section{
                   SettingItemView(settingItem: .help)
                   SettingItemView(settingItem: .tellAfriend)
                
                 
               }
           }
           .navigationTitle("Settings")
           .searchable(text: $searchString)
        }
    }
    
    
    fileprivate func userDetails() -> some View{
        return Section {
            HStack{
                Circle()
                    .frame(width: 35,height: 35)
                
                VStack(alignment: .leading) {
                    
                    HStack{
                        Text("Qa user 13")
                            .bold()
                        
                        Spacer()
                        Image(.qrcode)
                            .renderingMode(.template)
                            .padding(8)
                            .foregroundStyle(.blue)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                        
                    }
                    
                    Text("Hey there! Iam using Whatsapp.")
                        .foregroundStyle(.gray)
                        .font(.caption)
                }
                
            }
            
            SettingItemView(settingItem: .avator)
            
        }
    }
}

#Preview {
    SettingsTabScreen()
}
