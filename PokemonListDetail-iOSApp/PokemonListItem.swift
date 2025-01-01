//
//  PokemonListItem.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import SwiftUI
import PokemonAPI

struct PokemonListItemData: Hashable, Identifiable {
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
    var width: CGFloat
    var click: (PokemonListItemData) -> ()
    
    init(
        itemData: PokemonListItemData,
        width: CGFloat,
        click: @escaping (PokemonListItemData) -> ()
    ) {
        self.itemData = itemData
        self.width = width
        self.click = click
    }
    
    var body: some View {
        VStack {
            let url = URL(string: itemData.imageUrl)
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                AsyncImage(url: url) { result in
                    result.image?
                        .resizable()
                        .scaledToFit()
                }

            }
            .frame(width: width, height: width)
            .cornerRadius(32)

            Text(
                "\(itemData.name)"
            )
        }
        .onTapGesture(perform: {
            click(itemData)
        })
        .padding(16)
        .cornerRadius(32)
        .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    Group {
        PokemonListItem(itemData: PokemonListItemData(id: PokemonAPI.ID(""), name: "hasegawa", imageUrl: "https://img.pokemondb.net/artwork/bulbasaur.jpg"), width: CGFloat(200), click: { _ in })
        PokemonListItem(itemData: PokemonListItemData(id: PokemonAPI.ID(""), name: "hasegawa", imageUrl: "https://img.pokemondb.net/artwork/venusaur.jpg"), width: CGFloat(200), click: {_ in })
    }
}
