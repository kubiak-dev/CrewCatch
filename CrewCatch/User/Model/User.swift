//
//  User.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 09/03/2024.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    let profilePictureUrl: String?
    var bio: String?
    var age: Int?
}

class User: Identifiable {
    var userID: UUID = UUID()
    var email: String
    var name: String
    var username: String
    var password: String
    var trips: [Trip] = []
    var profilePicture: Data?
    var bio: String
    var dateOfBirth: Date

    var age: Int {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: Date())
        return ageComponents.year ?? 0
    }

    init(name: String, email: String, password: String, username: String, profilePicture: Data? = nil, bio: String, dateOfBirth: Date) {
        self.name = name
        self.email = email
        self.password = password
        self.profilePicture = profilePicture
        self.bio = bio
        self.dateOfBirth = dateOfBirth
        self.username = username
    }
}

extension User {
    static let mockUser = User(name: "Krzysztof", email: "kkubiakx@gmail.com", password: "password", username: "kkubiakx", profilePicture: nil, bio: "I'm a software developer, I love sailing and I'm looking for a crew to sail with me.", dateOfBirth: Calendar.current.date(from: DateComponents(year: 1999, month: 2, day: 1))!)
    static let mockUsers: [User] = [
        mockUser,
        User(name: "Paweł", email: "pawel65@gmail.com", password: "password", username: "pawelka", profilePicture: nil, bio: "I'm a retired Fire Department Officer, who loves the sea.", dateOfBirth: Calendar.current.date(from: DateComponents(year: 1965, month: 10, day: 13))!)
    ]
}
