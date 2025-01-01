//
//  ContentView.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI

struct ContentView: View {
    @State private var navigatePath: [String] = []
    var body: some View {
        NavigationStack(path: $navigatePath) {
            PokemonGridList(
                click: { data in
                    print(data.name)
                    navigatePath.append(data.name)
                }
            )
            .navigationDestination(for: String.self) { name in
                PokemonDetailScreen(name: name)
            }
        }
    }
}

#Preview {
    ContentView()
}
