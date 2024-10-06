//
//  FeedViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 06/10/2024.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [ThreadModel]()
    
    init(){
        Task {
            try await fetchThread()
            try await fetchUserDataForThreads()
        }
    }
    func fetchThread() async throws {
        self.threads = try await ThreadService.fetchThreads()
    }
    
    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
