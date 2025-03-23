//
//  LocationMapAnnotationView.swift
//  MapAppPreTry
//
//  Created by Morumbi on 3/19/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundStyle(.white)
                .padding(5.5)
                .background(.accent)
                .clipShape(.circle)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.accent)
                .frame(width: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    LocationMapAnnotationView()
}
