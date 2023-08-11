//
//  ProfileHeaderView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 31/07/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    var body: some View {
        VStack (spacing: 10){
            // pic and stats
            HStack {
                CircularProfileImageView(user: user,size: .large)
                Spacer()
                    .frame(height: 3)
                    .background(.red)
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    UserStatView(value: 3, title: "Followers")
                  UserStatView(value: 3, title: "Following")
                    
                }
            }
                .padding(.horizontal)
              //  .padding(.bottom, 4)
            //  Name bio
            VStack (alignment: .leading, spacing: 4) {
                
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)

                }
//
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)

                }
                

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            
            //action Button
            Button {
                if user.isCurrentUser {
                    print("ShowEditProfile")
                    showEditProfile.toggle()
                } else {
                    print("Follow user...")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360,height: 32)
                    .background(user.isCurrentUser ? .white : .blue)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear ,lineWidth:  1)
                             )
            }

            Divider()
        }.fullScreenCover(isPresented: $showEditProfile) {
            Task {
                try? await AuthService.shared.loadUserData()
            }
        } content: {
            EditProfileView(user: user)
        }

    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USER[0])
    }
}
