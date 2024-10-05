//
//  ImageUploader.swift
//  Threads_IOS_App
//
//  Created by Mac on 04/10/2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func UploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil}
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do{
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch{
            print("DEBUG: Image Upload Error with \(error.localizedDescription)")
            return nil
        }
    }
}
