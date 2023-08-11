//
//  FeedCell.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 28/07/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post: Post

    var body: some View {
        VStack {
            //image + username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xsmall)
                    Text(user.userName)
                        .font(.footnote)
                        .fontWeight(.semibold)

                }
                Spacer()
            }.padding(.leading, 8)
            
            
            //post Image
            KFImage(URL(string: post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            
            //action buttons
            HStack (spacing: 15) {
                Button {
                 print("Like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print("Comment on post")

                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)

                }
                
                Button {
                    print("share post")

                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)


                }
                Spacer()
            }.padding(.leading, 8)
                .padding(.top, 4)
                .foregroundColor(.black)
            
            
            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            //caption label
            HStack {
                Text("\(post.user?.userName ?? "" ) ").fontWeight(.semibold) +
                Text(post.caption)
            }.font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)

            Text("6h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)



        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POST[3])
    }
}
