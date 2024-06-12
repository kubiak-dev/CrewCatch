//
//  ProfileView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    private var currentUser: UserModel? {
        return viewModel.currentUser
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            // HEADER
            VStack {
                HStack {
//                    Image("profile")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 80, height: 80)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                        .shadow(radius: 10)
                    Circle()
                        .stroke(Color.accentColor, lineWidth:4)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Image("profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 76, height: 76)
                                .clipShape(Circle())
                        )


                    VStack(alignment: .leading) {
                        Text("\(currentUser?.fullname ?? "Krzysztof"),  \(currentUser?.age ?? 23)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.text)

                        Text("@\(currentUser?.username ?? "kkubiak")")
                            .font(.callout)
                            .italic()
                            .foregroundStyle(.text)

                        Spacer()
                    }
                    .padding(.leading, 10)

                    Spacer()

                    VStack {
                        Button(action: {
                            AuthService.shared.signOut()
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25, alignment: .top)
                                .foregroundColor(.text)
                        }
                        Spacer()
                    }
                }
                .tag("header")
                .padding()

                Text(currentUser?.bio ?? "bio")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 8)


                //Make visible only if current user
                Button(action: {
                    // Edit Profile
                }) {
                    Text("Edit Profile")
                        .font(.footnote)
                        .foregroundStyle(Color.background)
                        .padding()
                        .frame(width: 100, height: 25)
                        .background(Color.text)
                        .cornerRadius(15)
                }
                .padding(.vertical, 5)

                Divider()
                    .padding(5)
            }

            Text("\(currentUser?.fullname ?? "User")'s trips")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            VStack {
                ForEach((1...10), id: \.self) { _ in
                    TripCardView(trip: .constant(Trip.mockTrips[0]))
                }
            }
//            Group {
//                if user.trips.isEmpty {
//                    ContentUnavailableView(
//                        "No trips",
//                        systemImage: "magnifyingglass",
//                        description: Text("\(user.name) has no trips yet")
//                    )
//                } else {
////                    ForEach(1...10) {
////                        TripCardView(trip: Trip.mockTrip)
////                    }
//                }
//            }

        }
    }
}

#Preview {
    ProfileView()
}
