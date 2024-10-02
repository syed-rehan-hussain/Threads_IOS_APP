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
        //try await AuthService.shared.createUser(withEmail: email, password: password, fullname: name, username: username)
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploaduserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
            try await UserService.shared.fetchCurrentuser()
        } catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
        
    }
}
