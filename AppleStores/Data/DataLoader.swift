//
//  DataLoader.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import Foundation
import CoreLocation
import Combine

enum DataLoader {
    static func loadAppleStores() -> AnyPublisher<[AppleStore], Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://timroesner.com/applestores.json")!)
            .receive(on: RunLoop.main)
            .map({ $0.data })
            .decode(type: Root.self, decoder: JSONDecoder())
            .map({ $0.appleStores })
            .eraseToAnyPublisher()
    }
}

// MARK: - Decodable

private struct Root: Decodable {
    let appleStores: [AppleStore]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode([StoreData].self)
        appleStores = data.map { element in
            AppleStore(
                name: element.name,
                website: element.website,
                phone: element.phone,
                location: CLLocation(latitude: element.location.latitude, longitude: element.location.longitude),
                hours: element.hours
            )
        }
    }
}

private struct StoreData: Codable {
    let name: String
    let website: URL
    let phone: String
    let location: Location
    let hours: [Hour]
}

private struct Location: Codable {
    let latitude: Double
    let longitude: Double
}
