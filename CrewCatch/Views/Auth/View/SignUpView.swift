//
//  SignUpView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 12/03/2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                LogoNameView()
                Spacer()

                VStack {
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Enter your email address", text: $viewModel.email)
                            .roundedTextFieldWithBorder()
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)

                        TextField("Enter your username", text: $viewModel.username)
                            .roundedTextFieldWithBorder()
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)

                        SecureField("Enter your password", text: $viewModel.password)
                            .roundedTextFieldWithBorder()
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                    .padding(.horizontal, 28)
                }

                Spacer()
                    .frame(height: 40)
                
                Button(action: {
                    Task { try await viewModel.createUser() }
                }) {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundStyle(Color.background)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.text)
                        .cornerRadius(15)
                }
                .padding(.top, 30)

                Spacer()
                    .frame(height: 80)

                Button(action: { dismiss() } ) {
                    HStack {
                        Text("Already have an account?")
                        Text("Sign in.")
                            .fontWeight(.bold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.text)
                }
            }
            .shadow(radius: 6, x: 4, y: 15)
        }
    }
}

#Preview {
    SignUpView()
}
