//
//  ListView.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import SwiftUI

struct ListView: View {
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        NavigationView {
            List(dataManager.appleStores) { store in
                StoreCell(appleStore: store)
            }
            .navigationTitle("Stores")
        }.onAppear {
            dataManager.load()
        }
    }
}

struct StoreCell: View {
    let appleStore: AppleStore
    
    var body: some View {
        NavigationLink(destination: DetailView(appleStore: appleStore), label: {
            VStack(alignment: .leading) {
                Spacer()
                Text(appleStore.name)
                    .font(.headline)
                    .padding(.bottom, 4)
                if let firstHour = appleStore.hours.first {
                    Text(firstHour.time)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
                Spacer()
            }
        })
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
