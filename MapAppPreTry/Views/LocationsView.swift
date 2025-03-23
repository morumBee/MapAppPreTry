import MapKit
import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) var vm
    @State var isListExpanded: Bool = true

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            mapLayer
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()

                locationsPreviewStack
            }
        }
        .sheet(isPresented: $vm.showLearnMoreSheet) {
            LocationDetailView()
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}

extension LocationsView {
    private var mapLayer: some View {
        @Bindable var vm = vm
        return Map(position: $vm.mapRegion) {
            ForEach(vm.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 8)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
    }

    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .padding()
                    .overlay(alignment: .leading) {
                        Image(systemName: "chevron.right.circle")
                            .padding()
                            .imageScale(.large)
                            .rotationEffect(
                                .degrees(vm.showLocationsList ? 90 : 0)
                            )
                    }
            }
            .foregroundStyle(.primary)

            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }

    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
                }
            }
        }
    }
}
