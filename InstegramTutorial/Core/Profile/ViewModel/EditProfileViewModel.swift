//
//  ProfileViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 05/08/2023.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var profileImage: Image? // @Published any change on it will eefect the view (viewmodel.postImage) because the view is listining and waiting for a value from our view
    @Published var fullName: String = ""
    @Published var bio: String = ""
   // @Published var posts = [Post]()
    private var uiimage : UIImage?
    init(user: User) {
        self.user = user
        
        if let fullName = user.fullName {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let  data = try? await item.loadTransferable(type: Data.self) else {return} // take the data of selected photo , instead of completion handler
        
        guard let uiImage = UIImage(data: data) else {return}
        self.uiimage = uiImage
        self.profileImage = Image(uiImage: uiImage) // swiftUIImage
        
    }
    
    
    func updateUserData() async throws {
        // update profile image if changed
        
        var data = [String: Any]()
        
        //upload profile Image
        
        if let uiimage = uiimage {
            let imageurl = try? await ImageUploader.uploadImage(image: uiimage)
            data["profileImageUrl"] = imageurl
        }
        
        // update name if changed
        if !fullName.isEmpty && user.fullName != fullName {
           data["fullName"] = fullName
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
           data["bio"] = bio
        }
        
        if !(data.isEmpty ){
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
        
        
    }
}
