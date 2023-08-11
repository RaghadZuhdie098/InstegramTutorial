//
//  FeedViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 08/08/2023.
//

import Foundation
import Firebase
import FirebaseFirestore

@MainActor
class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
}
