//
//  SettingsModel.swift
//  WhatsAppClone
//
//  Created by Apple on 07/06/2026.
//

import SwiftUI

struct SettingsModel{
    let title:String
    let image:String
    let bgColor:Color
    var imageType:ImageType = .systemImage
    
}


enum ImageType{
    case systemImage
    case assetImage
}

extension SettingsModel{
    static let avator = SettingsModel(
        title: "Change profile photo",
        image: "photo",
        bgColor: .blue)
    
    static let broadcastingList = SettingsModel(
        title: "Broadcast Lists",
        image: "megaphone.fill",
        bgColor: .green)
    
    static let starredMessage = SettingsModel(
        title: "Starred Messages",
        image: "star.fill",
        bgColor: .yellow)
    
    static let linkedDevices = SettingsModel(
        title: "Linked Devices",
        image: "laptopcomputer",
        bgColor: .green)
    
    
    static let account = SettingsModel(
        title: "Account",
        image: "key.fill",
        bgColor: .blue)
    
    static let privacy = SettingsModel(
        title: "Privacy",
        image: "lock.fill",
        bgColor: .cyan)
    
    static let chats = SettingsModel(
        title: "Chats",
        image: "whatsapp-black",
        bgColor: .green,
        imageType:.assetImage)
    
    static let notifications = SettingsModel(
        title: "Notifications",
        image: "bell.badge.fill",
        bgColor: .red)
    
    static let storageAndData = SettingsModel(
        title: "Storage and Data",
        image: "arrow.up.arrow.down",
        bgColor: .green)
    
    static let help = SettingsModel(
        title: "Help",
        image: "info",
        bgColor: .blue)
    
    static let tellAfriend = SettingsModel(
        title: "Tell a friend",
        image: "heart.fill",
        bgColor: .red)
    
    
    
}
