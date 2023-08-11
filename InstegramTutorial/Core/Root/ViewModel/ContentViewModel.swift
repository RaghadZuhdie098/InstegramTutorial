//
//  ContentViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 02/08/2023.
//

import Foundation
import Firebase
import Combine
@MainActor
class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable> ()
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    /*
     This means that whenever the value of userSession changes (due to Firebase Authentication changes), SwiftUI will be notified to re-render the views observing the ContentViewModel.
     */
    
    init () {
        setupSubscribers()
    }

 func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in // it's listing to userSession from service
            self?.userSession = userSession
        }.store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in // it's listing to currentUser from service
            self?.currentUser = currentUser
        }.store(in: &cancellables)

    }
}
