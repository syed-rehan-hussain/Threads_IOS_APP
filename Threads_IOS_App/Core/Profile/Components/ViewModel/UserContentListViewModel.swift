//
//  UserContentListViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 06/10/2024.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [ThreadModel]()
    
    let user: User
    
    init(user: User){
        self.user = user
        Task {
            try await fetchUserThread()
        }
    }
    @MainActor
    func fetchUserThread() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
