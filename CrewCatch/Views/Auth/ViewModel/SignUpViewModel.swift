//
//  SignUpViewModel.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""

    @MainActor
    func createUser() async throws {
        print("DEBUG: Create user...")
        try await AuthService.shared.createUser(withEmail: email, password: password, username: username)
    }
}
