//
//  CommunityTabScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        
        NavigationStack{
            ScrollView {
                VStack(alignment:.leading,spacing: 10){
                    Image(.communities)
                    
                 
                        Text("Stay connected with a community")
                            .font(.title2)
                        
                        Text("Communities bring memmbers together in topic-based groups. Any communit you're added to will appear hear")
                            .foregroundStyle(.gray)
                   
                    
                    
                    Button {
                        
                    } label: {
                        Text("See example communities>")
                            .frame(maxWidth: .infinity,alignment: .center)
                            .foregroundStyle(.black)
                            .font(.headline)

                    }
                    
                    
                    
                    
                    Button {
                        
                    } label: {
                        Label("New Community",systemImage: "plus")
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .bold()
                            .padding()
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                    }

                    
                    
                }
            }.navigationTitle("Communities")
                .padding()
        }
    }
}

#Preview {
    CommunityTabScreen()
}
