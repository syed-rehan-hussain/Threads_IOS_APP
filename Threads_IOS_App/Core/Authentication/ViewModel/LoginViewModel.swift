//
//  LoginViewModel.swift
//  Threads_IOS_App
//
//  Created by Mac on 30/09/2024.
//

import Foundation


class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
