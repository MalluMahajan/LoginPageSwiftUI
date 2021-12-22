//
//  TextFieldComponent.swift
//  LoginPageSwiftUI
//
//  Created by Mallu on 21/12/21.
//

import SwiftUI

struct TextFieldComponent {
    
    //MARK: - Custom Username TextField
    func customUsernameField(userName: Binding<String>, borderColor: Color) -> some View {
        HStack {
            Image("username")
            TextField("", text: userName).foregroundColor(Color.black)
        }
        .padding()
        .keyboardType(.namePhonePad)
        .autocapitalization(.allCharacters)
        .background(Color.backgroundColor)
        .font(Font.custom(Constant.CustomFont.InterRegular, size: 17))
        .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(borderColor, lineWidth: 1)
               )
        .overlay(TextFieldOverlay().customOverlay(text: "Username", width: 100), alignment: .topLeading)
        .padding(.vertical, 12)
    }
    
    //MARK: - Custom Email TextField
    func customEmailField(email: Binding<String>, borderColor: Color) -> some View {
        HStack {
            Image("email")
            TextField("", text: email).foregroundColor(Color.black)
        }
        .padding()
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .background(Color.backgroundColor)
        .font(Font.custom(Constant.CustomFont.InterRegular, size: 17))
        .overlay(
                   RoundedRectangle(cornerRadius: 10)
                       .stroke(borderColor, lineWidth: 1)
               )
        .overlay(TextFieldOverlay().customOverlay(text: "Email address", width: 120), alignment: .topLeading)
        .padding(.vertical, 12)
    }
    
    //MARK: - Custom Password TextField
    func customPasswordField(password: Binding<String>, isSecurityCheck: Bool) -> some View{
        ZStack {
            if isSecurityCheck{
                TextField("", text: password)
                    .foregroundColor(Color.black)
            }else{
                SecureField("", text: password)
                    .foregroundColor(Color.black)
            }
        }
    }
}

//MARK:- Add title on textField
struct TextFieldOverlay {
    func customOverlay(text: String, width: CGFloat) -> some View{
        ZStack {
            ZStack{
                Color.white
                Color.clear
            }.frame(width: width, height: 2, alignment: .leading)
            Text(text)
                .padding(6)
                .font(Font.custom(Constant.CustomFont.InterMedium, size: 12.0))
                .foregroundColor(Color.textColor)
        }
        .padding(6)
        .position(x: width - 40, y: 0)
    }
}
