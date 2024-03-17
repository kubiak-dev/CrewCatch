//
//  SwiftUIView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/03/2024.
//

import SwiftUI

struct CreateProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    @State var email: String = "pawel@email.com" //change with logging support
    @State var password: String = "password" //change with logging support
    @State var bio: String = ""
    @State var dateOfBirth: Date = Date()
    @State var profilePicture: Data = Data()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Tell us about yourself", text: $bio)
                DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                Button("Create") {
//                    let newProfile = User(name: name, email: email, password: password, profilePicture: profilePicture, bio: bio, dateOfBirth: dateOfBirth)
//                  add user
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .disabled(name.isEmpty || bio.isEmpty || Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date()).year ?? 0 < 13)
                .padding(.vertical, 2)
                .navigationTitle("Create your profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreateProfileView()
}
