import SwiftUI

struct LocationPreviewView: View {
    @Environment(LocationsViewModel.self) var vm
    var location: Location

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            Spacer()
            VStack {
                learnButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    LocationPreviewView(location: LocationsViewModel().locations[0])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
}

extension LocationPreviewView {
    private var imageSection: some View {
        Image(location.imageNames[0])
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .clipShape(RoundedRectangle(cornerRadius: 7.5))
            .padding(5)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
    }

    private var learnButton: some View {
        Button {}
            label: {
                Text("Learn More")
                    .font(.headline)
                    .frame(width: 100, height: 35)
            }
            .buttonStyle(.borderedProminent)
    }

    private var nextButton: some View {
        Button {
            vm.nextButtonPressed(location: location)
        }
        label: {
            Text("Next")
                .font(.headline)
                .frame(width: 100, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
