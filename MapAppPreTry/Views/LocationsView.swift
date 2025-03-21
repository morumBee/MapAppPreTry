import MapKit
import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) var vm
    @State var isListExpanded: Bool = false

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            Map(position: $vm.mapRegion)

            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationsPreviewStack
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
        ScrollView {
            VStack(spacing: 0) {
                Button {
                    withAnimation(.spring()) {
                        isListExpanded.toggle()
                    }
                } label: {
                    HStack {
                        Label("Dropdown", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(isListExpanded ? 90 : 0))

                        Spacer()
                        Text("\(vm.mapLocation.name), \(vm.mapLocation.cityName)")
                            .font(.title3)
                            .fontWeight(.black)
                        Spacer()
                        Spacer()
                    }
                    .padding(.vertical, 20)
                    .background(Color.white)
                }
                .foregroundStyle(.primary)

                if isListExpanded {
                    VStack(spacing: 0) {
                        ForEach(vm.locations) { location in
                            Divider()
                            LocationsListView(location: location)
                                .transition(.move(edge: .top).combined(with: .opacity))
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.bottom, 20)
                }
            }
            .padding(.horizontal, 15)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
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
