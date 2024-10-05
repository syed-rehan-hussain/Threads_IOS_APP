//
//  ExploreViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 02/10/2024.
//

import Foundation


class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task{
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
