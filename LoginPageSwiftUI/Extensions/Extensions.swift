//
//  Extensions.swift
//  LoginPageSwiftUI
//
//  Created by Mallu on 20/12/21.
//

import SwiftUI


// MARK: Color Extention
extension Color {
    static let themeColor = Color("ThemeColor")
    static let lightThemeColor = Color("LightThemeColor")
    static let bordorColor = Color("BorderColor")
    static let backgroundColor = Color("BackgroundColor")
    static let textColor = Color("TextColor")
}

// MARK: String Extention
extension String {
    //MARK:- Check empty string
    func isEmptyOrWhitespace() -> Bool {
        if self.isEmpty {
            return true
        }
        // Trim and check empty string
        return (self.trimmingCharacters(in: .whitespaces) == "")
    }
    
    //MARK:- Email Validation
    func isValidEmail() -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    //MARK:- Username Validation
    func isValidUsername() -> Bool{
        let capitalLetterRegEx  = ".*[A-Z ]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: self)
        return capitalresult
    }
    
    //MARK:- Password validation
    func isValidPassword() -> Bool{
        let password = self.trimmingCharacters(in: .whitespaces)
                
        //Check password have 8 character
        let passwordCountResult = password.count < 8 ? false : true
        
        //Check password have one capital letter
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: self)

        //Check password have one digit
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: self)

        //Check password have one small letter
        let smallLetterRegEx  = ".*[a-z]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", smallLetterRegEx)
        let smallresult = texttest2.evaluate(with: self)

        return passwordCountResult && capitalresult && numberresult && smallresult
    }
}
