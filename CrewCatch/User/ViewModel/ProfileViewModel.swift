//
//  ProfileViewModel.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/06/2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: UserModel?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in view model from combine is \(user?.username ?? "")")
        }.store(in: &cancellables)
    }
}
