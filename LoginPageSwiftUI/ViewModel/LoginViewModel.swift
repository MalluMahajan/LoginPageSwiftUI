//
//  LoginViewModel.swift
//  LoginPageDemo
//
//  Created by Mallu on 20/12/21.
//

import UIKit
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var isShowPassword: Bool = false
    @Published var loginRequest = LoginRequest()
    @Published var showingAlert = false
    var errorMessage = String()
    
    //MARK:- Login User
    func actionLogin() {
        guard  !self.loginRequest.username.isEmptyOrWhitespace() && !self.loginRequest.email.isEmptyOrWhitespace() &&  !self.loginRequest.password.isEmptyOrWhitespace()else {
            errorMessage = LoginValidationError.emptyData.errorDescription ?? ""
            showingAlert = true
            return
        }
        guard  !self.loginRequest.username.isValidUsername() else{
            errorMessage = LoginValidationError.invalidUsername.errorDescription ?? ""
            showingAlert = true
            return
        }
        guard  self.loginRequest.password.isValidPassword() else{
            errorMessage = LoginValidationError.invalidPassowrd.errorDescription ?? ""
            showingAlert = true
            return
        }
        guard  self.loginRequest.email.isValidEmail() else{
            errorMessage = LoginValidationError.invalidEmailAddress.errorDescription ?? ""
            showingAlert = true
            return
        }
        showingAlert = false
        print("Login Success")
        
    }
    
}
//MARK:- Login request data
struct LoginRequest {
    var username: String = ""
    var email: String = ""
    var password: String = ""
}

// MARK:- Login validation error
enum LoginValidationError: LocalizedError {
    case emptyData
    case invalidUsername
    case invalidEmailAddress
    case invalidPassowrd

    var errorDescription: String? {
        switch self {
        case .emptyData:
            return "Please fill all fields"
        case .invalidUsername:
            return "Username should not have spaces and no upper case alphabet"
        case .invalidEmailAddress:
            return "You have entered invalid email address"
        case .invalidPassowrd:
            return "Password should have 8 characters, 1 number, 1 upper case alphabet and 1 lower case alphabet"
        }
    }
}
