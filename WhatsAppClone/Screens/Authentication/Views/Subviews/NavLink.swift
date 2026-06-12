//
//  NavLink.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI

struct NavLink: View {
    let title:String
    let subTitle:String
    var alignment:Alignment = .trailing
    
    var body: some View {
        HStack{
            Text(title)
            Text(subTitle)
                .bold()
        }.foregroundStyle(.black)
            .font(.title2)
        .frame(maxWidth: .infinity,alignment: alignment)
    }
}

#Preview {
    NavLink(title: "Forgot", subTitle: "Password?")
        .padding()
}
