//
//  ThreadViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 06/10/2024.
//

import Firebase
import FirebaseAuth

class ThreadViewModel: ObservableObject {
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = ThreadModel(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
