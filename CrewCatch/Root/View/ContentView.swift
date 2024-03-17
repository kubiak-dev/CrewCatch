//
//  ContentView.swift
//  CrewCatch
//
//  Created by Krzysztof Kubiak on 07/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                SignInView()
            }
        }
    }

}

#Preview {
    ContentView()
}
