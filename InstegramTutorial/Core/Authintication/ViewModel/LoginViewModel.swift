//
//  LoginViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 04/08/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
    
}
