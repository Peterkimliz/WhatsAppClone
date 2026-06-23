//
//  SettingsTabScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var searchString:String  = ""
    @State private var showLogoutDialog:Bool = false
    @Environment(AuthViewModel.self) private var authVm
    
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
                  
                   Button {
                       showLogoutDialog = true
                   } label: {
                       SettingItemView(settingItem: .logout)
                   }

                
                 
               }
           }
           .navigationTitle("Settings")
           .searchable(text: $searchString)
           .alert("Log Out",isPresented:$showLogoutDialog) {
               Button(role:.confirm) {
                   showLogoutDialog = false
                  Task {
                       await authVm.handleLogout()
                   }
                   
               } label: {
                   Text("Yes")
               }
               
               Button(role:.confirm) {
                   showLogoutDialog = false
               } label: {
                   Text("No")
                   
               }
               
           } message: {
               Text("Are you sure you want to Sign out?")
           }

          
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
    
    struct  SettingsTabScreenWrapper:View{
        @State private var authVm:AuthViewModel = AuthViewModel()
        
        var body:some View{
            SettingsTabScreen()
        }
        
        
    }
    
    return SettingsTabScreenWrapper()
 
}
