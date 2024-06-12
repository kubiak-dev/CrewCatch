//
//  AuthService.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?

    static let shared = AuthService()

    init() {
        self.userSession = Auth.auth().currentUser
    }

    @MainActor
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Signed in user \(result.user.uid)")
        } catch {
            print("DEBUG: signing in user \(error.localizedDescription)")
        }
    }

    @MainActor
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(email: email, fullname: "", username: username, id: result.user.uid)
            print("DEBUG: User created \(result.user.uid)")
        } catch {
            print("DEBUG: Error creating user \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            print("DEBUG: User signed out")
        } catch {
            print("DEBUG: Error signing out \(error.localizedDescription)")
        }

    }

    @MainActor
    private func uploadUserData(email: String, fullname: String, username: String, id: String) async throws {
        let user = UserModel(id: id, fullname: fullname, email: email, username: username, profilePictureUrl: nil, bio: nil)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
}
