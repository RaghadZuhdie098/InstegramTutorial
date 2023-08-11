//
//  UploadPostViewModel.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 31/07/2023.
//

import Foundation
import _PhotosUI_SwiftUI
import SwiftUI
import Firebase

@MainActor // (related to asyn await stuff) to back to the main view after finish loading image (it implements on background )
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var postImage: Image? // @Published any change on it will eefect the view (viewmodel.postImage) because the view is listining and waiting for a value from our view
    
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let  data = try? await item.loadTransferable(type: Data.self) else {return} // take the data of selected photo , instead of completion handler
        
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage) // swiftUIImage
        
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document() // to get id properity(firebase automatically generate post id)
        
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {return} // upload image before upload post
        
        let post = Post(id: postRef.documentID, ownerUserId: uid, caption: caption, likes: 0, imageURL: imageUrl, timestamp: Timestamp()) // ownerUserId: uid so can retrive the post and the user who post it 
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try? await postRef.setData(encodedPost)


    }
    
}
