//
//  PostsGridView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 31/07/2023.
//

import SwiftUI
import Kingfisher
struct PostsGridView: View {
    
    @StateObject var viewModel: PostGridViewModel
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
        // this is how to create stateObject that has an initialization parameter 
    }
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimenstion: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageURL))
                    .resizable()
                    .frame(width: imageDimenstion, height: imageDimenstion)
                    .scaledToFill()
                    .clipped()
                    
            }
        }
    }
}

struct PostsGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostsGridView(user: User.MOCK_USER[0])
    }
}
