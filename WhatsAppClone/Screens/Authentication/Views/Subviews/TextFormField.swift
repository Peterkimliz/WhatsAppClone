//
//  TextFormField.swift
//  WhatsAppClone
//
//  Created by Apple on 11/06/2026.
//

import SwiftUI

struct TextFormField: View {
    @Binding var value:String
    let image:String
    let placeholder:String
    var isSecure:Bool = false
    var keyBoardType:UIKeyboardType = .default
    var inputState:TextInputFieldsState
    
    var body: some View {
        
        let shadowColor:Color = {
            switch inputState {
            case .invalid:
                return .red
            case .valid:
                  return  .green
            case .empty:
                return .gray.opacity(0.5)
            }
        }()
        
        HStack {
            Image( systemName: image)
                .foregroundStyle(shadowColor)
                .padding(3)
            
            Group {
                if(isSecure){
                    SecureField(placeholder,text: $value)
                }else{
                    
                    TextField(placeholder, text:$value)
                }
                
            }
            .keyboardType(keyBoardType)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.none)
            .font(.system(size: 20))
        
        }.padding(.vertical,15)
        .padding(.horizontal,10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(shadowColor  ,lineWidth:1)
                .shadow(radius: 5,x: 0,y:2))
        
  
    }
}

#Preview {
    
    VStack{
        TextFormField(value: .constant(""), image: "person.fill", placeholder:"Username",inputState: .empty )
        
        TextFormField(value: .constant("johndoe@gmail.com"), image: "envelope.fill", placeholder:"Email", keyBoardType :.emailAddress,inputState: .valid )
        
        TextFormField(value: .constant("password"), image: "lock.fill", placeholder:"Password", isSecure: true,inputState: .invalid )
    }
}
