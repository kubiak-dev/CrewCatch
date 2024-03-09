//
//  TripModel.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 08/03/2024.
//

import Foundation
import SwiftData

@Model
class Trip {
    var startDate: Date
    var endDate: Date
    var startHour: Int
    var startMinute: Int
    var endHour: Int
    var endMinute: Int
    var startLocation: String
    var startHarbor: String
    var endLocation: String
    var endHarbor: String
    var stops: [Stop]

    init(startDate: Date, endDate: Date, startHour: Int, startMinute: Int, endHour: Int, endMinute: Int, startLocation: String, endLocation: String) {
        self.startDate = startDate
        self.endDate = endDate
        self.startHour = startHour
        self.startMinute = startMinute
        self.startLocation = startLocation
        self.endLocation = endLocation
        self.endHour = endHour
        self.endMinute = endMinute
    }

    var startTime: Date {
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: startDate)
        dateComponents.hour = startHour
        dateComponents.minute = startMinute
        return calendar.date(from: dateComponents)!
    }

    var endTime: Date {
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: endDate)
        dateComponents.hour = endHour
        dateComponents.minute = endMinute
        return calendar.date(from: dateComponents)!
    }

}

struct Stop {
    var country: String
    var city: String
    var harbor: String
    var arrival: Date?
    var departure: Date?
    var description: String?

    init(country: String, city: String, harbor: String, arrival: Date? = nil, departure: Date? = nil, description: String? = nil) {
        self.country = country
        self.city = city
        self.harbor = harbor
        self.arrival = arrival
        self.departure = departure
        self.description = description
    }
}
