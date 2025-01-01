// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonsQuery: GraphQLQuery {
  public static let operationName: String = "Pokemons"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Pokemons($first: Int!) { pokemons(first: $first) { __typename id name image } }"#
    ))

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var __variables: Variables? { ["first": first] }

  public struct Data: PokemonAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PokemonAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemons", [Pokemon?]?.self, arguments: ["first": .variable("first")]),
    ] }

    public var pokemons: [Pokemon?]? { __data["pokemons"] }

    /// Pokemon
    ///
    /// Parent Type: `Pokemon`
    public struct Pokemon: PokemonAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { PokemonAPI.Objects.Pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", PokemonAPI.ID.self),
        .field("name", String?.self),
        .field("image", String?.self),
      ] }

      /// The ID of an object
      public var id: PokemonAPI.ID { __data["id"] }
      /// The name of this Pokémon
      public var name: String? { __data["name"] }
      public var image: String? { __data["image"] }
    }
  }
}
