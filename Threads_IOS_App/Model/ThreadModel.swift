//
//  ThreadModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 06/10/2024.
//

import Firebase
import FirebaseFirestore

struct ThreadModel: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String{
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
