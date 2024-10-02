//
//  AuthService.swift
//  Threads_IOS_App
//
//  Created by Mac on 30/09/2024.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentuser()
        } catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username:String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploaduserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)   // save data in firestore database
            try await UserService.shared.fetchCurrentuser()     // fetch login current user data to show on profile and other pages
        } catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signout(){
        try? Auth.auth().signOut()  // signout on backend
        self.userSession = nil  // remove session on locally and update routing
        UserService.shared.reset()  //setcurrent object user to nil
    }
    
    @MainActor
    private func uploaduserData(
        withEmail email: String,
        fullname: String,
        username:String,
        id: String
    ) async throws {
        let user = User(id: id, email: email, fullname: fullname, username: username) // create user instance
        guard let userData = try? Firestore.Encoder().encode(user) else {               // convert in dictionary
            return
        }
        try await Firestore.firestore().collection("user").document(id).setData(userData)   // save in firestore database
        UserService.shared.currentUser = user
    }
}
