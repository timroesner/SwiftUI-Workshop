//
//  DataManager.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import Foundation
import CoreLocation

class DataManager: ObservableObject {
    private(set) var appleStores = [AppleStore]()
    
    init() {
        appleStores.append(testStore)
    }
    
    let testStore = AppleStore(
        name: "Apple Union Square",
        website: URL(string: "https://www.apple.com/retail/unionsquare/"),
        phone: "(415) 486 4800",
        location: CLLocation(latitude: 37.7887, longitude: -122.4072),
        hours: [
            Hour(day: "Mon - Sun", time: "11:00 a.m. - 6:00 p.m.")
        ]
    )
}
