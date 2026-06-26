//
//  StringExtensions.swift
//  WhatsAppClone
//
//  Created by Apple on 25/06/2026.
//

import Foundation


extension String{
    
    var isEmptyOrWhiteSpace:Bool{return trimmingCharacters(in: .whitespacesAndNewlines ).isEmpty}
    
}
