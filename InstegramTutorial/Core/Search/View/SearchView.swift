//
//  SearchView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 28/07/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach (viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack(spacing: 10){
                                CircularProfileImageView(user: user, size: .small)
                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .fontWeight(.semibold)
                                    
                                    if let fullName = user.fullName {
                                        Text(fullName)
                                    }
                                }.font(.footnote)
                                Spacer()
                            }.foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in // will return the user that we click on
                ProfileView(user: user)
            }).navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
