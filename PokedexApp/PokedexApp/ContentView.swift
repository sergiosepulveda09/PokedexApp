//
//  ContentView.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-05-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokedexView(pokemonPicked: Pokemon(attack: 10, defense: 10, description: "", evolutionChain: [], height: 10, id: 10, imageUrl: "", name: "", type: "", weight: 10))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
