//
//  ProfileView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 27/07/2023.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
            ScrollView {
                //header
              ProfileHeaderView(user: user)
        
                // post grid-View
             PostsGridView(user: user)

            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER[0])
    }
}
