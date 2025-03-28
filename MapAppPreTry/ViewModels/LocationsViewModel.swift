import Foundation
import MapKit
import SwiftUI

@Observable
class LocationsViewModel {
    var locations: [Location]
    var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    var mapRegion: MapCameraPosition = .region(MKCoordinateRegion())
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    var showLocationsList: Bool = false
    var showLearnMoreSheet: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = .region(
                MKCoordinateRegion(
                    center: location.coordinates,
                    span: self.mapSpan
                )
            )
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func toggleLearnMoreSheet() {
        showLearnMoreSheet.toggle()
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        if let idx = locations.firstIndex(of: mapLocation) {
            let nextIdx = (idx + 1) % locations.count
            showNextLocation(location: locations[nextIdx])
        }
    }
}
