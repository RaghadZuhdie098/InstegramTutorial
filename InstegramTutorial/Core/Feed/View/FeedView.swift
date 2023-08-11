//
//  FeedView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 28/07/2023.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
//                    ForEach(0...10, id: \.self) {
//                        post in
//                        FeedCell(post: <#Post#>)
//                    }
                }
                .padding(.top, 8)
            }.navigationTitle("Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing ) {
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                                .foregroundColor(.black)
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("Instagram_logo.svg")
                            .resizable()
                            .frame(width: 100, height: 32)
                    }
                }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
