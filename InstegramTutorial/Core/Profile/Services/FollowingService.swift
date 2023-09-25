//
//  FollowingService.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 16/08/2023.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

struct FollowingService {
    
    static let Yshared = FollowingService()
    
    func followUser(otherUserId: String) async throws {
        guard let currentUserId = Auth.auth().currentUser?.uid else {return}
        
        let currentUserFollowingRef = Firestore.firestore().collection("following").document(currentUserId).collection("following").document(otherUserId)
        
        let currentUserFollowersRef = Firestore.firestore().collection("followers").document(otherUserId).collection("followers").document(currentUserId)
        
        // Add a new follower and follower
        let timestamp = Date()
        let followingData: [String: Any] = [
            "timestamp": timestamp
        ]
        
        let followersData: [String: Any] = [
            "timestamp": timestamp
        ]
        
        do {
            try await currentUserFollowingRef.setData(followingData)
            try await currentUserFollowersRef.setData(followersData)
            print("Successfully added a new follower!")
        } catch {
            print("Error adding new follower: \(error)")
        }
    }
        
    
}
