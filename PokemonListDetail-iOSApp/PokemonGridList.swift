//
//  PokemonGridList.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI


struct PokemonGridList: View {
    
    @StateObject private var viewModel = PokemonListViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.pokemonDataList,  id: \.self) { pokemonData in
                    PokemonListItem(itemData: pokemonData)
                }
            }
            
        }
    }
}


#Preview {
    PokemonGridList()
}
