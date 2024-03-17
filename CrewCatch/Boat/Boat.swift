//
//  Boat.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 08/03/2024.
//

import Foundation

class Boat {
    var model: String
    var manufacturer: String?
    var name: String?
    var year: Int?
    var type: BoatType

    var length: Float? // in meters
    var width: Float? // in meters
    var draught: Float? // in meters

    var people: Int
    var cabins: Int
    var berths: Int
    var toilets: Int

    var sailArea: Float? // in square meters
    var engines: [Int]? // in horsepower
    var fuelTank: Int? // in liters
    var waterTank: Int? // in liters

    var amenities: [Amenity]?

    init(model: String, manufacturer: String? = nil, name: String? = nil, year: Int? = nil, type: BoatType, length: Float? = nil, width: Float? = nil, draught: Float? = nil, people: Int, cabins: Int, berths: Int, toilets: Int, sailArea: Float? = nil, engines: [Int]? = nil, fuelTank: Int? = nil, waterTank: Int? = nil, ameniites: [Amenity]? = nil) {
        self.model = model
        self.manufacturer = manufacturer
        self.name = name
        self.year = year
        self.type = type
        self.length = length
        self.width = width
        self.draught = draught
        self.people = people
        self.cabins = cabins
        self.berths = berths
        self.toilets = toilets
        self.sailArea = sailArea
        self.engines = engines
        self.fuelTank = fuelTank
        self.waterTank = waterTank
        self.amenities = ameniites
    }

    func addAmenities(amenities: [Amenity]) {
        self.amenities = (self.amenities ?? []) + amenities
    }

}

extension Boat {
    enum BoatType: String, Codable, Identifiable, CaseIterable {
        case SailingYacht = "Sailing Yacht"
        case Catamaran = "Catamaran"
        case Motoryacht = "Motoryacht"

        var id: Self {
            self
        }
    }
}

extension Boat {
    enum AmenityType: String, Codable {
        case navigation_safety = "Navigation and safety"
        case utensils = "Utensils"
        case entertainment = "Entertainment"

    }

    struct Amenity: Codable {
        var type: AmenityType
        var description: String

        init(type: AmenityType, description: String) {
            self.type = type
            self.description = description
        }
    }

    static var Amenities: [Amenity] = [
        Amenity(type: .navigation_safety, description: "Autopilot"),
        Amenity(type: .navigation_safety, description: "Generator"),
        Amenity(type: .navigation_safety, description: "Dinghy"),
        Amenity(type: .navigation_safety, description: "Solar panels"),
        Amenity(type: .navigation_safety, description: "Electric winches"),
        Amenity(type: .navigation_safety, description: "Echo sounder"),
        Amenity(type: .navigation_safety, description: "GPS plotter"),
        Amenity(type: .navigation_safety, description: "Inside steering wheel"),
        Amenity(type: .navigation_safety, description: "Outside steering wheel"),

        Amenity(type: .utensils, description: "Air conditioning"),
        Amenity(type: .utensils, description: "Shower"),
        Amenity(type: .utensils, description: "Heating"),
        Amenity(type: .utensils, description: "Kitchen utensils"),
        Amenity(type: .utensils, description: "Oven"),
        Amenity(type: .utensils, description: "Fridge"),
        Amenity(type: .utensils, description: "Microwave"),
        Amenity(type: .utensils, description: "Waste tank"),
        Amenity(type: .utensils, description: "Coffee machine"),
        Amenity(type: .utensils, description: "Water maker (desalinator)"),

        Amenity(type: .entertainment, description: "Outside speakers"),
        Amenity(type: .entertainment, description: "Inside speakers"),
        Amenity(type: .entertainment, description: "TV"),
        Amenity(type: .entertainment, description: "Outside speakers")
    ]
}

extension Boat {
    static var mockBoat: Boat = Boat(model: "4.4", manufacturer: "Bali", name: "Stenella", year: 2022, type: .Catamaran, length: 13.76, width: 7.40, draught: 1.20, people: 9, cabins: 4, berths: 8, toilets: 4, sailArea: 10.2, engines: [40, 40], fuelTank: 800, waterTank: 800, ameniites: [
        Amenity(type: .navigation_safety, description: "Autopilot"),
        Amenity(type: .navigation_safety, description: "Generator"),
        Amenity(type: .navigation_safety, description: "Dinghy"),
        Amenity(type: .navigation_safety, description: "Solar panels"),
        Amenity(type: .navigation_safety, description: "Electric winches"),
        Amenity(type: .navigation_safety, description: "Echo sounder"),
        Amenity(type: .navigation_safety, description: "GPS plotter"),

        Amenity(type: .utensils, description: "Shower"),
        Amenity(type: .utensils, description: "Heating"),
        Amenity(type: .utensils, description: "Air conditioning"),
        Amenity(type: .utensils, description: "Kitchen utensils"),
        Amenity(type: .utensils, description: "Oven"),
        Amenity(type: .utensils, description: "Fridge"),
        Amenity(type: .utensils, description: "Microwave"),
        Amenity(type: .utensils, description: "Waste tank"),
        Amenity(type: .utensils, description: "Coffee machine"),
        Amenity(type: .utensils, description: "Water maker (desalinator)"),

        Amenity(type: .entertainment, description: "TV"),
        Amenity(type: .entertainment, description: "Outside speakers"),
        Amenity(type: .entertainment, description: "Inside speakers"),
    ])
}
