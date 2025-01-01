//
//  PokemonGridList.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI


struct PokemonGridList: View {
    
    @StateObject private var viewModel = PokemonListViewModel()
    var click: (PokemonListItemData) -> ()

    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var columns: [GridItem] {
        [GridItem(.fixed(screenWidth/2)), GridItem(.fixed(screenWidth/2))]
    }
    
    init(click: @escaping (PokemonListItemData) -> Void) {
        self.click = click
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.pokemonDataList) { pokemonData in
                    PokemonListItem(
                        itemData: pokemonData,
                        width: (screenWidth/2)-32, 
                        click: click
                    )
                }
            }
        }
        .navigationTitle("Pokemon List")
    }
}


#Preview {
    PokemonGridList(
        click: { _ in }
    )
}
