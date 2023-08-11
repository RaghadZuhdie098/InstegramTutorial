//
//  AuthServices.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 02/08/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

/*
 In practice, you would typically use async functions when performing tasks that involve network requests, accessing databases, or any operation that could introduce latency and should not block the main thread to maintain the responsiveness of your application.
 */
@MainActor // (related to asyn await stuff) to back to the main

class AuthService {
    
    @Published var userSession: FirebaseAuth.User? // to know if we have signed in usr or not ?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task {
            try await loadUserData()
        }
        
    }
    
    @MainActor // (related to asyn await stuff) to back to the main
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch  {
            print("DEBUG:Failed to login user with error \(error)")
        }
    }
    
    @MainActor // (related to asyn await stuff) to back to the main
    func createUser(email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Did create user data...")

            await uploadUserData(userId: result.user.uid, userName: userName, email: email)
            print("Did upload user data...")
        } catch  {
            print("DEBUG:Failed to register user with error \(error)")
        }
    }
  
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUserId = userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUserId)
    }
    
    func signout()  {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(userId: String, userName: String, email: String) async {
        let user = User(id: userId, userName: userName, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(userId).setData(encodedUser)
    } // we don't use throws because it rarely ever does wrong
}
