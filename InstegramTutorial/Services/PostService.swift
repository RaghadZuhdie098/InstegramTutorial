//
//  PostService.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 09/08/2023.
//

import Foundation
import FirebaseFirestore

struct PostService {
    
    static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = snapshot.documents.compactMap { userDocument in
            try? userDocument.data(as: Post.self)
        }
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUserId
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        //        for post in posts {
        //            let ownerUid = post.ownerUserId
        //            let postUser = try await UserService.fetchUser(withUid: ownerUid)
        //            post.user = postUser // can't modify this because post is treated as constant
        //        } /

        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let query = try await postCollection.whereField("ownerUserId", isEqualTo: uid).getDocuments()
        return query.documents.compactMap { try? $0.data(as: Post.self)
        }
  

    }
    
}
