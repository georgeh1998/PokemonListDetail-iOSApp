//
//  PokemonListItem.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI


struct PokemonListItemData {
    
}

struct PokemonListItem: View {
    var body: some View {
        VStack {
            Image("SamplePokemon")
                .resizable()
                .scaledToFit()
            Text(
                "Pikachu"
            )
        }
        .padding(16)
        .background(.green)
        .cornerRadius(32)
        .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    PokemonListItem()
}
