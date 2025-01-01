//
//  PokemonDetailScreen.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2025/01/01.
//

import Foundation
import SwiftUI
import PokemonAPI

struct PokemonDetailScreen: View {
    
    @StateObject private var viewModel: PokemonDetailViewModel
    
    init(id: PokemonAPI.ID) {
        self._viewModel = StateObject(wrappedValue: PokemonDetailViewModel(id: id))
    }
    
    var body: some View {
        if let data = viewModel.pokemonDetailData {
            let url = URL(string: data.imageUrl)
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    AsyncImage(url: url) { result in
                        result.image?
                            .resizable()
                            .scaledToFit()
                    }
                }
                Text(data.name)
            }
        }
    }
}

struct PokemonDetailData: Identifiable {
    var id: PokemonAPI.ID
    var number: String
    var name: String
    var imageUrl: String
    var types: [String]
    var weight: Float
    var height: Float
    
    init(id: PokemonAPI.ID, number: String, name: String, imageUrl: String, types: [String], weight: Float, height: Float) {
        self.id = id
        self.number = number
        self.name = name
        self.imageUrl = imageUrl
        self.types = types
        self.weight = weight
        self.height = height
    }
}


#Preview {
    PokemonDetailScreen(id: PokemonAPI.ID("UG9rZW1vbjowMDE="))
}
