//
//  UserService.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/06/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: UserModel?

    static let shared = UserService()

    init() {
        Task {
            try await fetchCurrentUser()
        }
    }

    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: UserModel.self)
        self.currentUser = user

        print("DEBUG: Fetched user \(user.username)")
    }
}
