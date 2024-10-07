//
//  ThreadService.swift
//  Threads_IOS_App
//
//  Created by Mac on 06/10/2024.
//

import Firebase
import FirebaseFirestore

class ThreadService {
    static func uploadThread(_ thread: ThreadModel) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [ThreadModel] {
        let snapshot = try await Firestore
            .firestore().collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: ThreadModel.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [ThreadModel] {
        let snapshot = try await Firestore
            .firestore().collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: ThreadModel.self) })
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
