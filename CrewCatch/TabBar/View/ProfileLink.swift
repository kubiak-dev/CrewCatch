//
//  ProfileLink.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 21/03/2024.
//

import SwiftUI

struct ProfileLink: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ProfileView()) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.text)
                    Text("Profile")
                        .font(.system(size: 16))
                        .foregroundColor(.text)
                }
            }
        }
    }
}

#Preview {
    ProfileLink()
}
