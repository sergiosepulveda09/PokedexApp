//
//  PokemonView.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-05-30.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    let pokemon: Pokemon
    let pokemonVM: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, pokemonVM: PokemonViewModel) {
        self.pokemon = pokemon
        self.pokemonVM = pokemonVM
        self.backgroundColor = Color(pokemonVM.getBackgroundColor(type: pokemon.type))
    }
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonView_Previews: PreviewProvider {

    static var previews: some View {
        PokemonView(pokemon: Pokemon(attack: 10, defense: 10, description: "", evolutionChain: [], height: 10, id: 10, imageUrl: "", name: "Sergio", type: "Strong", weight: 10), pokemonVM: PokemonViewModel())
    }
}

