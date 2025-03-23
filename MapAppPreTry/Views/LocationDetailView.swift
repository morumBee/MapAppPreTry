import MapKit
import SwiftUI

struct LocationDetailView: View {
    @Environment(LocationsViewModel.self) var vm
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                    .shadow(radius: 15)

                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .scrollIndicators(.hidden)
        .overlay(alignment: .topLeading) {
            dismissButton
                .padding()
        }
    }
}

#Preview {
    LocationDetailView()
        .environment(LocationsViewModel())
}

extension LocationDetailView {
    private var imageSection: some View {
        let location = vm.mapLocation
        return TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                GeometryReader { geometry in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .clipped()
                }
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }

    private var titleSection: some View {
        let location = vm.mapLocation
        return VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }

    private var descriptionSection: some View {
        let location = vm.mapLocation
        return VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }

    private var mapLayer: some View {
        Map(position: .constant(vm.mapRegion)) {
            Annotation(vm.mapLocation.name, coordinate: vm.mapLocation.coordinates) {
                LocationMapAnnotationView()
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }

    private var dismissButton: some View {
        Button {
            vm.showLearnMoreSheet.toggle()
        }
        label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(12)
                .foregroundStyle(.black)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
        }
    }
}
