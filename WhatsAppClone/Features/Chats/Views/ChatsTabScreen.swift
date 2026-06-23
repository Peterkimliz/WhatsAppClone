//
//  ChatsTabScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct ChatsTabScreen: View {
    @State private var searchText:String = ""
    @State private var showModalSheet:Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                
                Button {
                    
                } label: {
                
                    Label( "Archived",systemImage: "archivebox.fill" )
                        .foregroundStyle(.gray)
                        .bold()
                        .padding()

                }
                
                ForEach(0..<10){_ in
                    
                    NavigationLink {
                        ChatRoom()
                    } label: {
                        ChatItemView()
                    }

                    
                    
                     
                }
                
                
                HStack(alignment: .top,spacing: 5){
                    Image(systemName: "lock.fill")
                    Text("Your personal message are")
                    Text("end-to-end encrypted").foregroundStyle(.blue)
                    
                    
                }.padding(.horizontal)
                .font(.caption)
                .foregroundStyle(.gray)
                .listRowSeparator(.hidden)
                
                
            }.listStyle(.plain)
             
            .navigationTitle("Chats")
                .searchable(text:$searchText)
                .toolbar {
                    toolBarMenu()
                    toolBarGroupedItems()
                }
        }   .sheet(isPresented: $showModalSheet, content: {
            NavigationStack{
                ChatOptionsScreen()
            }
        })
    }
}


extension ChatsTabScreen{
    
    @ToolbarContentBuilder
     func toolBarMenu() ->some  ToolbarContent{
        
         ToolbarItem(placement: .topBarLeading) {
            
            Menu {
                Button {
                    
                } label: {
                    Label("Select Chats",systemImage: "checkmark.circle")
                        .labelStyle(.titleAndIcon)
                    
                }
                
                
            } label: {
                Image(systemName: "ellipsis.circle")
        
            }
            
            
         }.sharedBackgroundVisibility(.hidden)
    }
    
    
    @ToolbarContentBuilder
    fileprivate func toolBarGroupedItems()-> some ToolbarContent{
        
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
                
            } label: {
                Image(.circle)
            }
            Button {
                
            } label: {
                Image(systemName: "camera")
            }
            Button {
                showModalSheet = true
            } label: {
                Image(.plus)
            }
         
            
            
            
        }.sharedBackgroundVisibility(.hidden)
    }
    
}
#Preview {
    ChatsTabScreen()
}
