//
//  SignInViewModel.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @MainActor
    func signIn() async throws {
        print("DEBUG: Sign in user...")
        try await AuthService.shared.signIn(withEmail: email, password: password)
    }
}
