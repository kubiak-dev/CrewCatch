//
//  TripListView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/03/2024.
//

import SwiftUI

struct TripListView: View {
    var trips: [Trip] = []
    @State private var createNewBook = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(trips) { trip in
                    NavigationLink {
//                        TripDetailView(trip: trip)
                    } label: {
//                        TripRow(trip: trip)
                    }
                }
            }
            .navigationTitle("My trips")
            .toolbar {
                Button {
                    createNewBook.toggle()
                }label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook) {
                NewTripView()
                    .presentationDetents([.medium])
            }
        }


    }
}

#Preview {
    TripListView()
}
