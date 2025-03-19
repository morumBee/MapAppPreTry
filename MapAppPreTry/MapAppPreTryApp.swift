//
//  MapAppPreTryApp.swift
//  MapAppPreTry
//
//  Created by Morumbi on 3/19/25.
//

import SwiftUI

@main
struct MapAppPreTryApp: App {
    @State private var locationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environment(locationsViewModel)
        }
    }
}
