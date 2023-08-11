//
//  UserStatView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 27/07/2023.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    var body: some View {
        
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)


            Text(title)
                .font(.footnote)
        }.frame(width: 72)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 23, title: "Followers")
    }
}
