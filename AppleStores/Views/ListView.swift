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
                NavigationLink(destination: DetailView(appleStore: store), label: {
                    Text(store.name)
                })
            }
            .navigationTitle("Stores")
        }.onAppear {
            dataManager.load()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
