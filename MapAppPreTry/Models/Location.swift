import Foundation
import MapKit

struct Location: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    var cityName: String
    var coordinates: CLLocationCoordinate2D
    var description: String
    var imageNames: [String]
    var link: String
}
