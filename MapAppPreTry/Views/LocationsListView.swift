import SwiftUI

struct LocationsListView: View {
    var location: Location
    var body: some View {
        HStack {
            Image(location.imageNames[0])
                .resizable()
                .scaledToFit()
                .frame(width: 45)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    LocationsListView(location: LocationsViewModel().locations[0])
}
