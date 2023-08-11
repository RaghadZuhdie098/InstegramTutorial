//
//  ImageUploader.swift
//  InstegramTutorial
//
//  Created by raghad zuhdie on 07/08/2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData =  image.jpegData(compressionQuality: 0.5) else { return nil } // to avoid large image to be uploaded so we compress it
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image -> ERROR \(error.localizedDescription)")
            return nil
        }
    }
}
