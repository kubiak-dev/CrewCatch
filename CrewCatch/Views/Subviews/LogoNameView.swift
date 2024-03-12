//
//  LogoNameView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 11/03/2024.
//

import SwiftUI

struct LogoNameView: View {
    var body: some View {
        VStack (spacing: 0) {
            Image("iosapptemplate")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.text, lineWidth: 4))

            Text("CrewCatch")
                .font(.custom("Abuget", size: 100))
                .foregroundStyle(Color.text)
        }
    }
}

#Preview {
    LogoNameView()
}
