//
//  ContentView.swift
//  WhatsAppClone
//
//  Created by Apple on 05/06/2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
    
            TabView{
                
                UpdateTabScreen()
                    .tabItem {
                        Image(systemName: TabItem.updates.icon)
                        Text(TabItem.updates.description)
                    }
                CallsTabScreen()
                    .tabItem{
                        Image(systemName: TabItem.calls.icon)
                        Text(TabItem.calls.description)
                    }
                    
                CommunityTabScreen()
                    .tabItem{
                        Image(systemName: TabItem.communities.icon)
                        Text(TabItem.communities.description)
                    }
                ChatsTabScreen()
                    .tabItem{
                        Image(systemName: TabItem.chats.icon)
                        Text(TabItem.chats.description)
                        
                    }
                SettingsTabScreen()
                    .tabItem{
                        Image(systemName: TabItem.settings.icon)
                        Text(TabItem.settings.description)
                }
            }
        
        
    }
}


extension MainTabView{
    
    
    private enum TabItem: String{
        case updates
        case calls
        case communities
        case chats
        case settings
        
        fileprivate var description:String{
            self.rawValue.capitalized
        }
        
        fileprivate var icon : String {
            switch self {
            case .updates:
                return "circle.dashed.inset.filled"
            case .calls:
                return "phone.fill"
            case .communities:
                return "person.3.fill"
            case .chats:
                return "message.fill"
            case .settings:
                return "gear"
            }
            
        }
        
    }
    
    
   
    
    
}




#Preview {
    MainTabView()
}
