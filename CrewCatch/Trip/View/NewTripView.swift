//
//  NewTripView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/03/2024.
//

import SwiftUI

struct NewTripView: View {
    @Environment(\.dismiss) var dismiss
    @State private var tripName: String = ""
    @State private var tripDescription: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var tripType: Trip.TripType = .recreational
    @State private var organizer: String = "Pawel"

    var body: some View {
        NavigationStack {
            Form {
                TextField("Trip name", text: $tripName)
                TextField("Description", text: $tripDescription)
                DatePicker("Start date", selection: $startDate, displayedComponents: .date)
                DatePicker("End date", selection: $endDate, displayedComponents: .date)
                Picker("Trip type", selection: $tripType) {
                    ForEach(Trip.TripType.allCases) { type in
                        Text(type.descr).tag(type)
                    }
                }
                Button("Create") {
//                    let newTrip = Trip(name: tripName, organizer: organizer, startDate: startDate, endDate: endDate)
//                    add trip
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(tripName.isEmpty || tripDescription.isEmpty)
                .padding(.vertical, 2)
                .buttonStyle(.borderedProminent)
                .navigationTitle("New trip")
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
    NewTripView()
}
