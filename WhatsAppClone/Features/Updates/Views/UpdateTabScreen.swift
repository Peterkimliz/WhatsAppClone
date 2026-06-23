//  UpdateTabScreen.swift
//  WhatsAppClone
//  Created by Apple on 06/06/2026.

import SwiftUI

struct UpdateTabScreen: View {
    @State var searchText:String = ""
    var body: some View {
        NavigationStack {
            List{
                Section(""){
                    StatusSectionHeader()
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets( EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 10))
                    
                }
                
                StatusSection()
                
                Section ("Recent Updates"){
                    RecentUpdateStatus()
                }
                
                
                Section {
                    ChannelItemView()
                    
                } header: {
                    HStack {
                        Text("Channels")
                        
                            .bold()
                        Spacer()
                        UpdateStatusFadeButton(image: "plus")
                    }
                }
                
                
                
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
                .listStyle(.grouped)
                .navigationTitle("Updates")
            
                .searchable(text: $searchText,placement:.toolbarPrincipal)
            
        }
    }
}

private struct StatusSectionHeader :View {
    var body: some View{
        HStack(alignment:.top) {
            
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
            
            
            VStack(alignment: .leading){
                    Text("Use Status to share photos,text and videos that disappear in 24 hours.")
                
                    Text("Status Privacy")
                        .foregroundStyle(.blue)
                        .bold()
                }
            
            Image(systemName: "xmark")
                .bold()
                .foregroundStyle(.gray)
            
        }.padding(10)
        .background(.whatsAppWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}


private struct RecentUpdateStatus :View {
    var body: some View{
        HStack(alignment:.top) {
            ImagePlaceHolder()
           VStack(alignment:.leading) {
                Text("Johseph Smith")
                    .font(.callout)
                    .bold()
                
                Text("1 hour ago")
                    .foregroundStyle(.gray)
            }
           
            
        }
        
    }
}




private struct StatusSection: View{
    
    var body: some View{
        
        HStack{
            
            ImagePlaceHolder()
            
            VStack(alignment:.leading) {
                Text("My Status")
                    .font(.callout)
                    .bold()
                
                Text("Add to my status")
                    .foregroundStyle(.gray)
            }
           
            Spacer()
            UpdateStatusFadeButton(image: "camera.fill")
            UpdateStatusFadeButton(image: "pencil")
            
        }
        
        
    }
}



private struct ChannelItemView : View{
    
    var body: some View{
        VStack(alignment: .leading,spacing: 40){
            Text("Stay updated on the topics that matterto you. Find  chabnnels to follow below")
                .foregroundStyle(.gray)
                .font(.callout)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(0..<10,id: \.self){ _ in
                        VStack{
                            ImagePlaceHolder()
                            Text("Real Madrid Cf")
                            Button {
                                
                            } label: {
                                Text("Follow")
                                   .bold()
                                    .background(.blue.opacity(0.3))
                                    .frame(maxWidth: .infinity )
                                      .clipShape(Capsule())
                                   
                                  
                            }.buttonStyle(.borderedProminent)
                            

                            
                        }.padding(.horizontal,16)
                        .padding(.vertical)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4),lineWidth: 1))
                        
                        
                    }
                    
                }
            }
            
            Button{
                
            }label:{
                Text("Explore")
                
            }.buttonStyle(.borderedProminent)
                .foregroundStyle(.white)
                .clipShape(Capsule())
     
        }
       
    }
    
}

private struct UpdateStatusFadeButton:View{
    var image:String
    
    var body:some View{
        Button {
            
        } label: {
            Image(systemName: image)
                .padding(10)
                .background(Color(.systemGray4))
                .imageScale(.medium)
            
                .clipShape(Circle())
        }

        
    }
}





private struct  ImagePlaceHolder: View{
    var body:some View{
        Circle()
            .frame(width: 55,height: 55)
    }
}
#Preview {
    NavigationStack{
        UpdateTabScreen()
    }
}
