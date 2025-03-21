import MapKit
import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) var vm
    @State var isListExpanded: Bool = true

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            Map(position: $vm.mapRegion)

            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}

// MARK: - header

extension LocationsView {
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
}

// MARK: - locationsPreviewStack

extension LocationsView {
    private var locationsPreviewStack: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 7, style: .continuous)
                    .foregroundStyle(Color(#colorLiteral(red: 0.8953682184, green: 0.8953682184, blue: 0.8953682184, alpha: 1)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 135)
                HStack(alignment: .bottom) {
                    LocationPreviewView(location: vm.mapLocation)
                    Spacer()
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
                .padding(18)
            }
        }
        .padding()
        .padding(.bottom, 10)
    }
}
