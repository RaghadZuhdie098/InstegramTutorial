//
//  UserServices.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 04/08/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    static func fetchAllUsers() async throws -> [User] {
        
        var users = [User]()
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents

        for doc in documents {
            guard let user = try? doc.data(as: User.self) else { return users }
            users.append(user)
        }
        return snapshot.documents.compactMap { userDocument in
            try? userDocument.data(as: User.self)
        }
    }
    
    static func fetchUser(withUid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(withUid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
}
