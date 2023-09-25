//
//  ProfileHeaderViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 16/08/2023.
//

//Software Engineer ( iOS Developer )
import Foundation

class ProfileHeaderViewModel: ObservableObject {
    
    private let user: User
    @Published var isFollowing = false
    
    init(user: User) {
        self.user = user
    }
    
    func followUser() async throws {
        do {
            try? await FollowingService.shared.followUser(otherUserId: user.id)
        }
        catch {
            print("there is Error.")
        }
        // the word button will change
    }
    
    func getUserState() {
        // get number of following
        // get number of followers
        
    
    }
    
    
}
