//
//  PokemonListViewModel.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import Foundation
import PokemonAPI


class PokemonListViewModel: ObservableObject {
    
    @Published var pokemonDataList = [PokemonListItemData]()
    
    init() {
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
        Network.shared.apollo.fetch(query: PokemonsQuery(first: 180)) { [weak self] result in
            guard let self = self else {
                 return
             }
            switch result {
            case .success(let graphQLResult):
                guard let pokemons = graphQLResult.data?.pokemons else {
                    return
                }
                pokemonDataList.append(
                    contentsOf: pokemons.compactMap {
                        $0?.toUiItem()
                    }
                )
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}

extension PokemonsQuery.Data.Pokemon {
    
    func toUiItem() -> PokemonListItemData {
        return PokemonListItemData(
            id: self.id,
            name: self.name ?? "",
            imageUrl: self.image ?? ""
        )
    }
    
}

