//
//  TabBarView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import SwiftUI

struct TabBarView: View {
    enum Tab {
        case discover, mytrips, profile
    }

    @State private var selectedTab: Tab = .discover
    @State private var tabState: Visibility = .visible
    @State private var newTripSheet = false
    @State private var sheetHeight: CGFloat = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                // DISCOVER TAB
                NavigationStack {
                    DiscoverView()
                        .navigationTitle("Discover")
                }
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Image(systemName: selectedTab == .discover ? "magnifyingglass" : "magnifyingglass")
                    Text("Discover")
                }
                .tag(Tab.discover)

                // MY TRIPS TAB
                NavigationStack {
                    MyTripsView()
                        .navigationTitle("My Trips")
                }
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Image(systemName: "sailboat")
                        .environment(\.symbolVariants, selectedTab == .mytrips ? .fill : .none)
                    Text("My Trips")
                }
                .tag(Tab.mytrips)

                // PROFILE TAB
                NavigationStack {
                    ProfileView()
//                        .navigationTitle("Profile")
                }
                .toolbar(tabState, for: .tabBar)
                .animation(.easeInOut(duration: 0.3), value: tabState)
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == .profile ? .fill : .none)
                    Text("Profile")
                }
                .tag(Tab.profile)

            }
        }
    }
}

#Preview {
    TabBarView()
}
