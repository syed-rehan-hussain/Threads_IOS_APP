//
//  UserService.swift
//  Threads_IOS_App
//
//  Created by Mac on 01/10/2024.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore


class UserService {
    @Published var currentUser: User?
    static var shared = UserService()
    init() {
        Task {
            try await fetchCurrentuser()
        }
    }
    @MainActor
    func fetchCurrentuser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("user").document(uid).getDocument()
        
        //Tries to convert the Firestore document's data into an instance of the User model using Swift's Codable protocol.
        let user = try snapshot.data(as: User.self)
        
        self.currentUser = user
        print("DEBUG: User is \(user)")
    }
    
    func reset(){
        self.currentUser = nil
    }
    
}
