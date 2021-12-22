//
//  ButtonComponent.swift
//  LoginPageSwiftUI
//
//  Created by Mallu on 20/12/21.
//

import SwiftUI

struct ButtonComponent {
    
    //MARK: - Custom Button
    func customButton(buttonTitle: String) -> some View {
        HStack {
            // Login
            Text(buttonTitle)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(Color.white).tracking(-0.41)
                .multilineTextAlignment(.center)
        }
        .frame(width: UIScreen.main.bounds.size.width - 60, height: 52)
        .background(Color.themeColor)
        .cornerRadius(10)
        .font(Font.custom(Constant.CustomFont.InterSemiBold, size: 20))
    }
}
