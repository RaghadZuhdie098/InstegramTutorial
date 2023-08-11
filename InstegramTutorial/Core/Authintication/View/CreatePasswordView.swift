//
//  CreatePasswordView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 30/07/2023.
//

import SwiftUI

struct CreatePasswordView: View {
    
    
    @Environment(\.dismiss) var dismiss // it's know how the screen show modally or in stack (navigation)
    @EnvironmentObject var viewmModel: RegistrationViewModel

    var body: some View {
        
        VStack(spacing: 12) {
            Text("Creat a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("Password", text: $viewmModel.password)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            NavigationLink {
                CompleteSignupView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
