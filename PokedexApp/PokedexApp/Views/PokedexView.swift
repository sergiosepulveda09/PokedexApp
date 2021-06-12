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
    @State var searchItem: String = ""
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    SearchBar(searchItem: $searchItem)
                        .padding(.bottom, 20)
                    Spacer()
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        
                        //This variable contains the condition that helps the program search specific pokemons according to their name or type, if it doesn't match, it'll return the full list of pokemons
                        let conditionSearch = pokemonVM.pokemon.filter({"\($0.name)".contains(searchItem.lowercased()) || searchItem.isEmpty || "\($0.type)".contains(searchItem.lowercased())})
                        
                        ForEach(conditionSearch) { pokemon in
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
                .navigationTitle("Pokedex")
                }
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
