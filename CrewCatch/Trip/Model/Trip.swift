//
//  Trip.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 08/03/2024.
//

import Foundation
import MapKit

class Trip: Identifiable {
    var tripID: UUID = UUID()
    var name: String

    var organizer: String
//    weak var participants: [User]?

    var crew: [String]

    var stops: [Stop]

    var startDate: Date {
        return stops.first?.departureTime ?? Date()
    }
    var endDate: Date {
        return stops.last?.arrivalTime ?? Date()
    }
//    var startDate: Date
//    var endDate: Date
    var tripType: TripType
    var boat: Boat?
    var maxCrewString: String {
        if let x = boat?.people {
            return String(x)
        } else {
            return "?"
        }
    }

    init(name: String, organizer: String, crew: [String] = [], stops: [Stop] = [], startDate: Date, endDate: Date, tripType: TripType = .recreational, boat: Boat? = nil) {
        self.name = name
        self.organizer = organizer
        self.crew = crew
        self.crew.append(organizer)
        self.stops = stops
        self.tripType = tripType
        self.boat = boat
    }

}

extension Trip {
    enum TripType: Int, Codable, Identifiable, CaseIterable {
        case recreational, trainig, recreationalAndTraining

        var id: Self {
            self
        }
        
        var descr: String {
            switch self {
            case .recreational:
                return "Recreational"
            case .trainig:
                return "Training"
            case .recreationalAndTraining:
                return "Recreational and Training"
            }
        }
    }
}

extension Trip {
    static var mockTrip: Trip {
        Trip(name: "Majowa wycieczka w chuj",
             organizer: "Krzysztof",
             crew: ["Ilona", "Adam", "Paweł", "Julia"],
             stops: [
                Stop(location: CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0122), departureTime: Date(), name: "Start"),
                Stop(location: CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0122), arrivalTime: Date(), name: "End")
             ],
             startDate: Date(),
             endDate: Date(),
             tripType: .recreationalAndTraining
        )
    }
}
