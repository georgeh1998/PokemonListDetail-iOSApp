//
//  PokemonGridList.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI


struct PokemonGridList: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(0...8, id: \.self) { value in
                    PokemonListItem()
                }
            }
            
        }
    }
}


#Preview {
    PokemonGridList()
}
