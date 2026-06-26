//
//  FirebaseCostants .swift
//  WhatsAppClone
//
//  Created by Apple on 25/06/2026.
//

import Foundation
import FirebaseDatabase
enum FirebaseConstants{
    private static let dbRef = Database.database().reference()
    
    static let UsersRef = dbRef.child("users")
    static let ChannelsRef = dbRef.child("channels")
    static let ChannelMessagesRef = dbRef.child("channel-messages")
    static let UserChannelsRef = dbRef.child("user-channels")
    static let UserDirectChannelsRef = dbRef.child("user-direct-channels")
    
    
    
    
    
}
