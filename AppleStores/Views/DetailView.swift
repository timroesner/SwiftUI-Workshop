//
//  DetailView.swift
//  AppleStores
//
//  Created by Tim Roesner on 7/17/20.
//

import SwiftUI

struct DetailView: View {
    let appleStore: AppleStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(appleStore.name)
                .font(.title)
            DividingSpace()
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
        }
        .padding(.horizontal, 16)
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
        DetailView(appleStore: DataManager.testStore)
    }
}
