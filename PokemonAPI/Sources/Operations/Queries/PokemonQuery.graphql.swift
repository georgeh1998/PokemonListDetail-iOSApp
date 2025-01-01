// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PokemonQuery: GraphQLQuery {
  public static let operationName: String = "Pokemon"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Pokemon($id: String!) { pokemon(id: $id) { __typename id number name image types resistant weaknesses weight { __typename minimum maximum } height { __typename minimum maximum } } }"#
    ))

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: PokemonAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { PokemonAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon", Pokemon?.self, arguments: ["id": .variable("id")]),
    ] }

    public var pokemon: Pokemon? { __data["pokemon"] }

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
        .field("number", String?.self),
        .field("name", String?.self),
        .field("image", String?.self),
        .field("types", [String?]?.self),
        .field("resistant", [String?]?.self),
        .field("weaknesses", [String?]?.self),
        .field("weight", Weight?.self),
        .field("height", Height?.self),
      ] }

      /// The ID of an object
      public var id: PokemonAPI.ID { __data["id"] }
      /// The identifier of this Pokémon
      public var number: String? { __data["number"] }
      /// The name of this Pokémon
      public var name: String? { __data["name"] }
      public var image: String? { __data["image"] }
      /// The type(s) of this Pokémon
      public var types: [String?]? { __data["types"] }
      /// The type(s) of Pokémons that this Pokémon is resistant to
      public var resistant: [String?]? { __data["resistant"] }
      /// The type(s) of Pokémons that this Pokémon weak to
      public var weaknesses: [String?]? { __data["weaknesses"] }
      /// The minimum and maximum weight of this Pokémon
      public var weight: Weight? { __data["weight"] }
      /// The minimum and maximum weight of this Pokémon
      public var height: Height? { __data["height"] }

      /// Pokemon.Weight
      ///
      /// Parent Type: `PokemonDimension`
      public struct Weight: PokemonAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokemonAPI.Objects.PokemonDimension }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("minimum", String?.self),
          .field("maximum", String?.self),
        ] }

        /// The minimum value of this dimension
        public var minimum: String? { __data["minimum"] }
        /// The maximum value of this dimension
        public var maximum: String? { __data["maximum"] }
      }

      /// Pokemon.Height
      ///
      /// Parent Type: `PokemonDimension`
      public struct Height: PokemonAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { PokemonAPI.Objects.PokemonDimension }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("minimum", String?.self),
          .field("maximum", String?.self),
        ] }

        /// The minimum value of this dimension
        public var minimum: String? { __data["minimum"] }
        /// The maximum value of this dimension
        public var maximum: String? { __data["maximum"] }
      }
    }
  }
}
