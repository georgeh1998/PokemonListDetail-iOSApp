//
//  PokemonDetailViewModel.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2025/01/01.
//

import Foundation

import Foundation
import PokemonAPI


class PokemonDetailViewModel: ObservableObject {
    
    private var id: PokemonAPI.ID
    @Published var pokemonDetailData: PokemonDetailData?
    
    init(id: PokemonAPI.ID) {
        self.id = id
        // TODO (Section 13 - https://www.apollographql.com/docs/ios/tutorial/tutorial-subscriptions#use-your-subscription)
        Network.shared.apollo.fetch(query: PokemonQuery(id: String(id))) { [weak self] result in
            guard let self = self else {
                 return
             }
            switch result {
            case .success(let graphQLResult):
                guard let pokemon = graphQLResult.data?.pokemon else {
                    return
                }
                pokemonDetailData = pokemon.toUiItem()
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}

extension PokemonQuery.Data.Pokemon {
    
    func toUiItem() -> PokemonDetailData {
        let id = self.id
        let number = self.number ?? ""
        let name = self.name ?? ""
        let imageUrl = self.image ?? ""
        let maximumWeight = self.weight?.maximum.toFloatOrZero() ?? 0
        let minimumWeight = self.weight?.minimum.toFloatOrZero() ?? 0
        let weight = (maximumWeight + minimumWeight) / 2
        let maximumHeight = self.height?.maximum.toFloatOrZero() ?? 0
        let minimumHeight = self.height?.minimum.toFloatOrZero() ?? 0
        let height = (maximumHeight + minimumHeight) / 2
        let types = self.types?.compactMap { $0 } ?? []
        return PokemonDetailData(
            id: id,
            number: number,
            name: name,
            imageUrl: imageUrl,
            types: types,
            weight: weight,
            height: height
        )
    }
    
}
