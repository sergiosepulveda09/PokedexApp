//
//  PokedexView.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-05-30.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())]
    @State var showDetailView = false
    @StateObject var pokemonVM = PokemonViewModel()
    @State var pokemonPicked: Pokemon
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(pokemonVM.pokemon) { pokemon in
                            PokemonView(pokemon: pokemon, pokemonVM: pokemonVM)
                                .onTapGesture {
                                    withAnimation(.easeIn) {
                                        pokemonPicked = pokemon
                                        showDetailView.toggle()
                                    }
                                }
                            }
                        }

                    }
                }
                .navigationTitle("Pokedex")
            if showDetailView {
                PokemonDetailView(pokemon: pokemonPicked, pokemonVM: pokemonVM, backgroundColor: Color(pokemonVM.getBackgroundColor(type: pokemonPicked.type)) , show: $showDetailView)
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView( pokemonPicked: Pokemon(attack: 10, defense: 10, description: "", evolutionChain: [], height: 10, id: 10, imageUrl: "", name: "", type: "", weight: 10))

    }
}
