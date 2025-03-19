//
//  LocationsViewModel.swift
//  MapAppPreTry
//
//  Created by Morumbi on 3/19/25.
//

import Foundation

@Observable
class LocationsViewModel {
    var locations: [Location] = LocationsDataService.locations
}
