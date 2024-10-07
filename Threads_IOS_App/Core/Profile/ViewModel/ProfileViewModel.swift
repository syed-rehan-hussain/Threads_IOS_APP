//
//  ProfileViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 01/10/2024.
//

import Combine
import PhotosUI
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }

}
