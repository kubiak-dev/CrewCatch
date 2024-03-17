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

//    var organizer: User
//    var participants: [User]?
    var organizer: String
    var crew: [String]?

    var stops: [Stop]?

//    var startDate: Date {
//        return stops?.first?.departureTime ?? Date()
//    }
//    var endDate: Date {
//        return stops?.last?.arrivalTime ?? Date()
//    }
    var startDate: Date
    var endDate: Date

    init(name: String, organizer: String, crew: [String]? = nil, stops: [Stop]? = nil, startDate: Date, endDate: Date) {
        self.name = name
        self.organizer = organizer
        self.crew = crew
        self.stops = stops
        self.startDate = startDate
        self.endDate = endDate
    }

//    init(name: String, organizer: User, participants: [User]? = nil, stops: [Stop]? = nil) {
//        self.name = name
//        self.organizer = organizer
//        self.participants = participants
//        self.stops = stops
//    }

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
        Trip(name: "Mock Trip", 
             organizer: "Paweł",
             crew: ["Ilona", "Adam", "Krzysiek"],
             stops: [],
             startDate: Date(),
             endDate: Date())
    }
}
