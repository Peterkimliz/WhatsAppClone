//
//  NewGroupScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 20/06/2026.
//

import SwiftUI

struct NewGroupScreen: View {
    @State private var searchText:String = ""
    var chatVm:ChatsViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewGroupScreen(chatVm: ChatsViewModel())
}
