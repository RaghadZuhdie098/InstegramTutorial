//
//  CompleteSignupView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 30/07/2023.
//

import SwiftUI

struct CompleteSignupView: View {
    
    @Environment(\.dismiss) var dismiss // it's know how the screen show modally or in stack (navigation)
    @EnvironmentObject var viewmModel: RegistrationViewModel

    var body: some View {
        
        VStack(spacing: 12) {
            
            Spacer()
            Text("Welcome to Instegram, \(viewmModel.userName)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("click below to complete registration and start using instegram")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
          
            Button {
                Task {
                        try await  viewmModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
                
                
            }.padding(.vertical)
            


            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CompleteSignupView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignupView()
    }
}
