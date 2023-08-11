//
//  ContentView.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel =  RegistrationViewModel()
  
    /*
     In SwiftUI, @StateObject is used to declare a property that holds an instance of an observable object (a class that conforms to ObservableObject).
     */
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                /*
                 Because userSession is marked with @Published(in ContentViewModel), any change to this property will trigger an objectWillChange notification, indicating that the ContentViewModel has changed.
                 */
                LoginView()
                    .environmentObject(registrationViewModel)
                //every child view after that will have environment object in it
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
