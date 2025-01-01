//
//  PokemonDetailScreen.swift
//  PokemonListDetail-iOSApp
//
//  Created by Hasegawa Gota on 2025/01/01.
//

import Foundation
import SwiftUI

struct PokemonDetailScreen: View {
    
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        Text(name)
    }
}


#Preview {
    PokemonDetailScreen(name: "hasegawa")
}
