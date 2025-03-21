import SwiftUI

struct LocationsListView: View {
    @Environment(LocationsViewModel.self) var vm
    var body: some View {
        List(vm.locations) { location in
            Button {
                vm.showNextLocation(location: location)
            } label: {
                listRowView(location: location)
            }
            .padding(.vertical, 4)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environment(LocationsViewModel())
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
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
        }
    }
}
