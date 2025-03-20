import SwiftUI

struct LocationPreviewView: View {
    var location: Location

    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 7, style: .continuous)
                .foregroundStyle(Color(#colorLiteral(red: 0.8953682184, green: 0.8953682184, blue: 0.8953682184, alpha: 1)))
                .frame(maxWidth: .infinity)
                .frame(height: 135)
            HStack(alignment: .bottom) {
                titleArea
                Spacer()
                buttonsArea
            }
            .padding(18)
        }
    }
}

#Preview {
    LocationPreviewView(location: LocationsViewModel().locations[0])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
}

extension LocationPreviewView {
    private var titleArea: some View {
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

extension LocationPreviewView {
    private var buttonsArea: some View {
        VStack {
            Button {}
                label: {
                    Text("Learn more")
                        .foregroundStyle(.white)
                        .frame(width: 130, height: 45)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            Button {}
                label: {
                    Text("Next")
                        .foregroundStyle(.red)
                        .frame(width: 130, height: 45)
                        .background(Color.gray.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
        }
        .font(.subheadline)
        .fontWeight(.bold)
    }
}
