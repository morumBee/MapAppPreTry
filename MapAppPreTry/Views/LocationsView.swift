import SwiftUI

struct LocationsView: View {
    @Environment(LocationsViewModel.self) var vm
    @State var isListExpanded: Bool = false

    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea(edges: .all)

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
                        Text("Pantheon, Rome")
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
