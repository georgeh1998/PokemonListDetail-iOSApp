//
//  PokemonListItem.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI
import PokemonAPI

struct PokemonListItemData: Hashable {
    var id: PokemonAPI.ID
    var name: String
    var imageUrl: String
    
    init(id: PokemonAPI.ID, name: String, imageUrl: String) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
}

struct PokemonListItem: View {
    
    var itemData: PokemonListItemData
    
    init(itemData: PokemonListItemData) {
        self.itemData = itemData
    }
    
    var body: some View {
        VStack {
            let url = URL(string: itemData.imageUrl)
            AsyncImage(url: url) { result in
                result.image?
                    .resizable()
                    .scaledToFill()
            }
            .aspectRatio(1.0, contentMode: .fit)
            Text(
                "\(itemData.name)"
            )
        }
        .padding(16)
        .background(.green)
        .cornerRadius(32)
        .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    PokemonListItem(itemData: PokemonListItemData(id: PokemonAPI.ID(""), name: "hasegawa", imageUrl: "hasegawa"))
}
