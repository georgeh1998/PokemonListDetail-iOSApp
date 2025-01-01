//
//  ContentView.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI
import PokemonAPI

struct ContentView: View {
    @State private var navigatePath: [String] = []
    var body: some View {
        NavigationStack(path: $navigatePath) {
            PokemonGridList(
                click: { data in
                    navigatePath.append(data.id)
                }
            )
            .navigationDestination(for: PokemonAPI.ID.self) { id in
                PokemonDetailScreen(id: id)
            }
        }
    }
}

#Preview {
    ContentView()
}
