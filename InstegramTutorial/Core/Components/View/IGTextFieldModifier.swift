//
//  IGTextFieldModifier.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 30/07/2023.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
        .font(.subheadline)
        .padding(12)
        .background(.gray)
        .cornerRadius(10)
        .padding(.horizontal, 24)

    }
}
