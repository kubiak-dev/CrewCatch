//
//  LoginView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 11/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                LogoNameView()
                Spacer()

                VStack {
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Email address", text: $email)
                            .roundedTextFieldWithBorder()
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)

                        SecureField("Password", text: $password)
                            .roundedTextFieldWithBorder()
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                    .padding(.horizontal, 28)
                }

                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .foregroundColor(.text)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                .frame(height: 40)

                Button(action: {}) {
                    Text("Sign in")
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

                NavigationLink(destination: SignUpView().navigationBarHidden(true)) {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign up.")
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
    LoginView()
}
