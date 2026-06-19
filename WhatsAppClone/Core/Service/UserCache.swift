//
//  UserCache.swift
//  WhatsAppClone
//
//  Created by Apple on 19/06/2026.
//
import SwiftUI

struct UserCache {
    private static let key = "cachedUserModel"
    
    static func save(_ user: UserModel) {
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    static func load() -> UserModel? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(UserModel.self, from: data)
    }
    
    static func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
