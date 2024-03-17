//
//  AuthService.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import Foundation
import Firebase

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
}
