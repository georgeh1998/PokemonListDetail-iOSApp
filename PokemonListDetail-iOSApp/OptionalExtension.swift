//
//  OptionalExtension.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2025/01/01.
//

import Foundation



extension Optional where Wrapped == String {
    func toFloatOrZero() -> Float {
        switch self {
        case .some(let value):
            return Float(value) ?? 0
        case .none:
            return 0
        }
    }
}
