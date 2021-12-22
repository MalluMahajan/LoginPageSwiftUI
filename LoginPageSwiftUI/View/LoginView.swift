//
//  ContentView.swift
//  LoginPageSwiftUI
//
//  Created by Mallu on 20/12/21.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        ScrollView{
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 40, alignment: .center)
                    .padding(70)
                
                HStack{
                    TextFieldComponent().customUsernameField(userName: $loginViewModel.loginRequest.username, borderColor: self.loginViewModel.loginRequest.username.isEmptyOrWhitespace() || self.loginViewModel.loginRequest.username.isValidUsername() ? Color.bordorColor : Color.lightThemeColor)
                }
                
                HStack {
                    Image("password")
                    TextFieldComponent().customPasswordField(password: $loginViewModel.loginRequest.password, isSecurityCheck: self.loginViewModel.isShowPassword)
                     
                    Spacer()
                    Button(action: {
                        loginViewModel.isShowPassword.toggle()
                    }, label: {
                        Image(self.loginViewModel.isShowPassword ? "eye" : "eye")
                            .frame(width: 30, height: 30)
                    })
                }
                .padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .background(Color.backgroundColor)
                .font(Font.custom(Constant.CustomFont.InterRegular, size: 17))
                .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(self.loginViewModel.loginRequest.password.isValidPassword() ? Color.lightThemeColor : Color.bordorColor, lineWidth: 1)
                        )
                .overlay(TextFieldOverlay().customOverlay(text: "Password", width: 100), alignment: .topLeading)
                .padding(.vertical, 12)
               
                TextFieldComponent().customEmailField(email: $loginViewModel.loginRequest.email, borderColor: self.loginViewModel.loginRequest.email.isEmptyOrWhitespace() || !self.loginViewModel.loginRequest.email.isValidEmail() ? Color.bordorColor : Color.lightThemeColor)
                   
                HStack {
                Spacer()
                Button(action: {}) {
                    Text(Constant.kForgotPassword)
                        .padding(.vertical, 20)
                    }
                .foregroundColor(Color.lightThemeColor)
                .font(Font.custom(Constant.CustomFont.InterMedium, size: 15))
                }
                Button(action: {
                    loginViewModel.actionLogin()
                }, label: {
                    ButtonComponent().customButton(buttonTitle: Constant.kLogin)
                })
                .padding(.top, 30)
                .alert(isPresented: $loginViewModel.showingAlert, content: {
                            Alert(title: Text(""),
                                  message: Text(loginViewModel.errorMessage),
                                  dismissButton: .default(Text("OK")) {  })
                        })
                
            }.padding(.horizontal, 50.0)
        }
        Spacer()
        VStack {
            HStack {
                Text(Constant.kDontHaveAccount)
                    .font(Font.custom(Constant.CustomFont.InterRegular, size: 15))
                    .foregroundColor(Color.textColor).tracking(-0.24)
                
                Button(action: {
                    
                }, label: {
                    Text(Constant.kSignUp)
                        .font(Font.custom(Constant.CustomFont.InterRegular, size: 15))
                        .foregroundColor(Color.lightThemeColor).tracking(-0.24)
                })
            }
            Spacer()
                .frame(height: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
