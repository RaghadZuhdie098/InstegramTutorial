//
//  SearchViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 04/08/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    @MainActor // this function publish user so it needs mainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
