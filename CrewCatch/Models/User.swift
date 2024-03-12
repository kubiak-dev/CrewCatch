//
//  User.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 09/03/2024.
//

import Foundation
import SwiftData

@Model
class User: Hashable, Identifiable {
    @Attribute(.unique) var userID: UUID = UUID()
    @Attribute(.unique) var email: String
    var name: String
    var password: String
//    var trips: [Trip]
    var profilePicture: Data?
    var bio: String
    var dateOfBirth: Date

    var age: Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        return ageComponents.year ?? 0
    }

    init(name: String, email: String, password: String, profilePicture: Data? = nil, bio: String, dateOfBirth: Date) {
        self.name = name
        self.email = email
        self.password = password
//        self.trips = []
        self.profilePicture = profilePicture
        self.bio = bio
        self.dateOfBirth = dateOfBirth
    }
}

extension User {
    
}
