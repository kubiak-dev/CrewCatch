//
//  DiscoverView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 17/03/2024.
//

import SwiftUI

struct DiscoverView: View {
    var trips: [Trip] = Trip.mockTrips
    var body: some View {
//        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(trips, id: \.id) { trip in
                        TripCardView(trip: .constant(trip))
                    }
                }
            }
//        }
    }
}

#Preview {
    DiscoverView()
}
