//
//  DetailView.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import SwiftUI
import MapKit

struct DetailView: View {
    let appleStore: AppleStore
    
    @State private var mapRegion: MKCoordinateRegion
    
    init(appleStore: AppleStore) {
        self.appleStore = appleStore
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        self._mapRegion = State(initialValue: MKCoordinateRegion(center: appleStore.location.coordinate, span: mapSpan))
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                Map(coordinateRegion: $mapRegion, annotationItems: [appleStore]) { item in
                    MapMarker(coordinate: item.location.coordinate)
                }.frame(height: reader.size.height * 0.6)
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    ForEach(appleStore.hours, id: \.self) { hour in
                        HStack {
                            Text(hour.day)
                            Spacer()
                            Text(hour.time)
                        }
                    }
                    DividingSpace()
                    Text(appleStore.phone)
                    DividingSpace()
                    Link("apple.com", destination: appleStore.website)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle(appleStore.name)
    }
}

struct DividingSpace: View {
    var body: some View {
        Spacer()
        Divider()
        Spacer()
    }
}

// MARK: - Preview

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(appleStore: DataManager.testStore)
        }
    }
}
