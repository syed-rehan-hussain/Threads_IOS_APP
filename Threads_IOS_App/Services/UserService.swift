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
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUserId = Auth.auth().currentUser?.uid else { return [] }
        let snapshot = try await Firestore.firestore().collection("user").getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter({$0.id != currentUserId})
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("user").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func reset(){
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfilelmage(withlmageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("user").document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
    
}
