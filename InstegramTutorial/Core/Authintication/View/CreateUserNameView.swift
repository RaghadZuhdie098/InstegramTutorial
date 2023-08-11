//
//  CreateUserNameView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 30/07/2023.
//

import SwiftUI

struct CreateUserNameView: View {
    
    @Environment(\.dismiss) var dismiss // it's know how the screen show modally or in stack (navigation)
    @EnvironmentObject var viewmModel: RegistrationViewModel

    var body: some View {
        
            VStack(spacing: 12) {
                Text("Creat username")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("you will use this email to sign in in your account")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                TextField("Username", text: $viewmModel.userName)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                NavigationLink {
                    CreatePasswordView()
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

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}
