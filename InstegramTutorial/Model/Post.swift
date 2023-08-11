//
//  Post.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 31/07/2023.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUserId: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Timestamp // firebase could not accept Date()
    var user: User? //later on
}


extension Post {
    static var MOCK_POST: [Post] = [
        .init(id: NSUUID().uuidString, ownerUserId: NSUUID().uuidString, caption: "This is some test caption for now", likes: 123, imageURL: "image1", timestamp: Timestamp(), user: User.MOCK_USER[0]),
        .init(id: NSUUID().uuidString, ownerUserId: NSUUID().uuidString, caption: "This is some test caption for now2", likes: 2123, imageURL: "image2", timestamp: Timestamp(), user: User.MOCK_USER[1]),
        .init(id: NSUUID().uuidString, ownerUserId: NSUUID().uuidString, caption: "This is some test caption for now3", likes: 1223, imageURL: "image3", timestamp: Timestamp(), user: User.MOCK_USER[2]),
        .init(id: NSUUID().uuidString, ownerUserId: NSUUID().uuidString, caption: "This is some test caption for now4", likes: 342, imageURL: "image4", timestamp: Timestamp(), user: User.MOCK_USER[1]),
        .init(id: NSUUID().uuidString, ownerUserId: NSUUID().uuidString, caption: "This is some test caption for now5", likes: 342, imageURL: "image1", timestamp: Timestamp(), user: User.MOCK_USER[3]),

        ]
}
