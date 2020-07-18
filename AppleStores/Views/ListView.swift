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
                Text(store.name)
            }
            .navigationTitle("Stores")
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
