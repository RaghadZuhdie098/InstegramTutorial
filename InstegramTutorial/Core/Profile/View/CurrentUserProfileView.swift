//
//  CurrentUserProfileView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 31/07/2023.
//

import SwiftUI
import Firebase

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
        
                    ScrollView {
                        //header
                        ProfileHeaderView(user: user)
                        // post grid-View
                        PostsGridView(user: user)

                    }.navigationTitle("Profile")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing ) {
                                Button {
                                         AuthService.shared.signout()
                                } label: {
                                    Image(systemName: "line.3.horizontal")
                                        .foregroundColor(.black)
                                }

                            }
                        }
              //  }
                
        }
    }
    
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USER[0])
    }
}
