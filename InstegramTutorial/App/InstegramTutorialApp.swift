//
//  InstegramTutorialApp.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 27/07/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct InstegramTutorialApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


// we user Firebase -> Storage _> to srore images we don't use firebase database to store images because it's large -> in database we put imageUrl it's a pointer to the location of image inside storage.
