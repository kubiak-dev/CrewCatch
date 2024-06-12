//
//  Stop.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 10/03/2024.
//

import Foundation
import MapKit

class Stop: Codable {
    var location: Coordinate2D {
        didSet {
            updateLocationInfo()
        }
    }
    var arrivalTime: Date?
    var departureTime: Date?
    var name: String
    var desc: String?

    var country: String?
    var city: String?

    init(location: CLLocationCoordinate2D, arrivalTime: Date? = nil, departureTime: Date? = nil, name: String, description: String? = nil) {
        self.location = Coordinate2D(location)
        self.arrivalTime = arrivalTime
        self.departureTime = departureTime
        self.name = name
        self.desc = description
//        updateLocationInfo()
    }

    private func updateLocationInfo() {
        let locationInfo = performReverseGeocoding()
        country = locationInfo?.country
        city = locationInfo?.city
    }

    private func performReverseGeocoding() -> (country: String?, city: String?)? {
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        var country: String?
        var city: String?
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else {
                print("Reverse geocoding failed with error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            country = placemark.country
            city = placemark.locality
        }
        return (country, city)
    }
}


class Coordinate2D: Codable {
    var latitude: Double
    var longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Coordinate2D {
    convenience init(_ location: CLLocationCoordinate2D) {
        self.init(latitude: location.latitude, longitude: location.longitude)
    }

    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
