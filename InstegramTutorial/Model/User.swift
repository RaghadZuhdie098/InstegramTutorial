//
//  User.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 30/07/2023.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var userName: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
    
    
}


extension User {
    static var MOCK_USER : [User] = [
        .init(id: NSUUID().uuidString, userName: "User1", profileImageUrl: nil, fullName: "User1 User1", bio: "nil", email: "User1@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "User2", profileImageUrl: "image2", fullName: "User2 User2", bio: "I'm number 2", email: "User2@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "User3", profileImageUrl: nil, fullName: "User3 User3", bio: "I'm number 3", email: "User3@gmail.com"),
        .init(id: NSUUID().uuidString, userName: "User4", profileImageUrl: "image4", fullName: "User4 User4", bio: "I'm number 4", email: "User4@gmail.com"),
    ]
}
