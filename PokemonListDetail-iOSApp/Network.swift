//
//  Network.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2024/12/31.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql-pokemon2.vercel.app/")!)
}
