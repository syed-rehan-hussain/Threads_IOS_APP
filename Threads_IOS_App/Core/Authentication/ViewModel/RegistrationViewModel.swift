//
//  RegistrationViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 30/09/2024.
//

import Foundation


class RegistrationViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: name, username: username)
    }
}
