//
//  LoginView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 29/07/2023.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        
        
        NavigationStack {
            VStack {
                Spacer()
                //logo image
                Image("Instagram_logo.svg")
                    .resizable()
                    .frame(width: 220,height: 100)
                    .scaledToFit()
                // text fields
                VStack(spacing: 10) {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())

                    
                    
                    SecureField("Password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                    
                }
                
                
                //Button
                Button {
                    print("Forget password")
                } label: {
                    Text("Forget password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
               
                // .frame(maxWidth: .infinity, alignment: .trailing) inside label: { }
                //Effectively, both code snippets might produce a similar visual appearance depending on the context they are used in. However, the first code snippet applies the frame to the entire Button, while the second code snippet applies it specifically to the Text label within the Button.
                
                
                //Login button
                
                Button {
                    Task {
                        try await viewModel.signIn()
                    }
                    
                } label: {
                    Text("LogIn")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
                }.padding(.vertical)
                
                
                HStack(spacing: 20) {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2 ) - 50, height: 0.5)
                    //.frame(width: .infinity, height: 2)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                    //  .frame(width: .infinity, height: 2)
                        .frame(width: (UIScreen.main.bounds.width / 2 ) - 50, height: 0.5)
                }.padding(.horizontal)
                    .foregroundColor(.gray)
                
                
                // facebook
                
                HStack {
                    Image("Facebook.svg")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue With Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }.padding(.top, 8)
                
                
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
