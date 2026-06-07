//
//  CallsTabScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText:String = ""
    
    @State private var selectedHistory:CallHistory = .all
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                   CreateCallLinkSection()
                    
                }
                
                Section{
                    ForEach(0..<10) { _ in
                        RecentCallItemView()
                    }
                  
                    
                }header: {
                    Text("Recent")
                        .foregroundStyle(.black)
                        .bold()
                    
                }
            }
            .navigationTitle("Calls")
            .searchable(text: $searchText,placement: .toolbar)
            .toolbar {
                
                ToolbarItem(placement:.principal) {
                    Picker("", selection:$selectedHistory) {
                        ForEach(CallHistory.allCases) { item in
                            Text(item.rawValue.capitalized).tag(item)
                        }
                        
                    }.pickerStyle(.segmented)
                


                }
                ToolbarItem(placement:.topBarTrailing) {
                    Image(systemName:"phone.arrow.up.right")
                        .background(.clear)
                        .foregroundStyle(.gray)
                }
                
            }
        }
    }
}


extension CallsTabScreen{
    
    private enum CallHistory:String,CaseIterable,Identifiable{
        case all, missed
        
        var id:Self{
            return self
        }
    }
    
}


private struct CreateCallLinkSection: View  {
    
    var body: some View{
        HStack(alignment:.top){
            
            Image(systemName: "link")
                .padding(8)
                .foregroundStyle(.blue)
                .background(Color(.systemGray6))
                .clipShape(Circle())
            
            VStack(alignment:.leading) {
                Text("Create Call Link")
                    .foregroundStyle(.blue)
                    .bold()
                Text("Share a link for your whats app call")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            
            
            
        }
        
        
    }
}


private struct RecentCallItemView:View{
    
    var body: some View{
        
        HStack {
         Circle()
                .frame(width: 55,height: 55)
         
            VStack (alignment:.leading){
               Text("John doe")
                    .bold()
                    .font(.callout)
                
                HStack (spacing:5){
                    Image(systemName: "phone.arrow.up.right.fill")
                    
                    Text("Outgoing")
                         
                         
                }
                .foregroundStyle(.gray)
            }
            
            
            Spacer()
            
            Text("Yesterday")
                .foregroundStyle(.gray)
            
            Image(systemName: "info.circle")
            
            
        }
        
    }
}

#Preview {
    CallsTabScreen()
}
