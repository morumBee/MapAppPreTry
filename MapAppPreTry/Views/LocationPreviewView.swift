import SwiftUI

struct LocationPreviewView: View {
    var location: Location

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image(location.imageNames[0])
                .resizable()
                .scaledToFit()
                .frame(width: 95)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 4)
                }

            VStack(alignment: .leading, spacing: 5) {
                Text(location.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(location.cityName)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    LocationPreviewView(location: LocationsViewModel().locations[0])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
}
