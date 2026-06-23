//
//  ChatOptionsScreen.swift
//  WhatsAppClone
//
//  Created by Apple on 19/06/2026.
//

import SwiftUI

struct ChatPartnerScreen: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            List {

            }.navigationTitle("Chat Options")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .padding(10)
                                .background(Color(.systemGray6))
                                .clipShape(Circle())
                        }

                    }.sharedBackgroundVisibility(.hidden)
                }
        }
    }
}

#Preview {

    ChatPartnerScreen()

}
