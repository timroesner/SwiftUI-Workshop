//
//  AppleStore.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import Foundation
import CoreLocation

struct AppleStore: Identifiable {
    let id = UUID()
    let name: String
    let website: URL?
    let phone: String
    let location: CLLocation
    let hours: [Hour]
}

struct Hour: Codable {
    let day: String
    let time: String
}
