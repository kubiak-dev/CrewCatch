//
//  FullTripView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 09/04/2024.
//

import SwiftUI

struct FullTripView: View {
    var body: some View {
        VStack {
            Button {

            } label: {
                Text("Join Trip")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Button {

            } label: {
                Text("Dupa")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())

            }
        }
    }
}

#Preview {
    FullTripView()
}
