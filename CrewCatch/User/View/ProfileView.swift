//
//  ProfileView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var user = User.mockUser

    var body: some View {
        ScrollView(showsIndicators: false) {
            // HEADER
            VStack {
                HStack {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)

                    VStack(alignment: .leading) {
                        Text("\(user.name),  \(user.age)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.text)

                        Text("@\(user.username)")
                            .font(.callout)
                            .italic()
                            .foregroundStyle(.text)

                        Spacer()
                    }
                    .padding(.leading, 10)

                    Spacer()

                    VStack {
                        Button(action: {
                            // Share Profile
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
                .padding()
                
                Text(user.bio)

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

            Text("\(user.name)'s trips")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            VStack {
                ForEach((1...10), id: \.self) { _ in
                    TripCardView(trip: .constant(Trip.mockTrip))
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
