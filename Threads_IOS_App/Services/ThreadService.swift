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
}
