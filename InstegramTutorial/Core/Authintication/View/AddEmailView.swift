//
//  AddEmailView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 29/07/2023.
//

import SwiftUI

struct AddEmailView: View {
    
    @Environment(\.dismiss) var dismiss // it's know how the screen show modally or in stack (navigation)
    @EnvironmentObject var viewModel: RegistrationViewModel
    /*
     each view : email,username,passsword,complete sign up need viewmode(RegistrationView model) we don't want to keep pass it from view to view, EnvironmentObject allows us yo utilize that view model in all of view withou having to pass it along from view to another
     */
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add you email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("you will use this email to sign in in your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Email", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUserNameView()
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



struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
