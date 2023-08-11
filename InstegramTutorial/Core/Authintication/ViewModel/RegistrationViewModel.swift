//
//  AuthinticationViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 02/08/2023.
//

import Foundation
/*
 RegistrationVM contains all the properties needed for sign up that get set throughout the registration flow.
 Also responsible for calling 'createUser|' function in AuthService
 The auth service here is the same shared instance that the ContentView is using.
 When the userSession gets set from the registration flow, it will also update the ContentView
 */
class RegistrationViewModel: ObservableObject {
    
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    /*
     keep track of them @published
     */
    
    func createUser() async throws {
      try await AuthService.shared.createUser(email: email, password: password, userName: userName)
        
        userName = ""
        email = ""
        password = ""
    }
    

}
