//
//  DataManager.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import Foundation
import Combine
import CoreLocation

class DataManager: ObservableObject {
    @Published
    private(set) var appleStores = [AppleStore]()
    
    private var token: Cancellable?
    
    init() {
        appleStores.append(Self.testStore)
    }
    
    func load() {
        token?.cancel()
        
        token = DataLoader.loadAppleStores()
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] result in
                self?.appleStores = result
            }
    }
    
    static let testStore = AppleStore(
        name: "Apple Union Square",
        website: URL(string: "https://www.apple.com/retail/unionsquare/")!,
        phone: "(415) 486 4800",
        location: CLLocation(latitude: 37.7887, longitude: -122.4072),
        hours: [
            Hour(day: "Mon - Sat", time: "11:00 a.m. - 6:00 p.m."),
            Hour(day: "Sun", time: "11:00 a.m. - 5:00 p.m.")
        ]
    )
}
