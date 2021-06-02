//
//  PokemonDetailView2.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-06-01.
//

import SwiftUI
import Kingfisher
struct PokemonDetailView2: View {
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
            LinearGradient(gradient: Gradient(colors: [backgroundColor, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                GeometryReader { proxy in
                    VStack {
                        ScrollView {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .fill(Color.white)
                                    .frame(height: proxy.size.height * 0.8)
                                    .offset(y: 200)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: -10)
                                VStack(spacing: 20) {
                                    ImageView(pokemon: pokemon)
                                    NameView(pokemon: pokemon)
                                    TypeView(pokemon: pokemon, pokemonVM: pokemonVM)
                                    DescriptionView(pokemon: pokemon)
                                    StatsView(pokemon: pokemon)
                                        .offset(y: 70)
                                        

                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            }
                        
                        }
                    }
                }
            }
            
        }
        
    }
}

struct PokemonDetailView2_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView2(pokemon: Pokemon(attack: 10, defense: 10, description: "ss", evolutionChain: [], height: 10, id: 10, imageUrl: "Bulbasaur", name: "Sergio", type: "Strong", weight: 10), pokemonVM: PokemonViewModel())
    }
}

struct ImageView: View {
    let pokemon: Pokemon
    var body: some View {
            KFImage(URL(string: pokemon.imageUrl))
//            Image(pokemon.imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                //            .offset(y: -5)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
    }
}

struct NameView: View {
    let pokemon: Pokemon
    var body: some View {
        Text(pokemon.name.capitalized)
            .font(.largeTitle)
            .fontWeight(.medium)
            .kerning(-0.5)
//            .offset(y: -5)
    }
}

struct TypeView: View {
    let pokemon: Pokemon
    let pokemonVM: PokemonViewModel
    let backgroundColor: Color
    init(pokemon: Pokemon, pokemonVM: PokemonViewModel) {
        self.pokemon = pokemon
        self.pokemonVM = pokemonVM
        self.backgroundColor = Color(pokemonVM.getBackgroundColor(type: pokemon.type))
    }
    var body: some View {
        Text(pokemon.type)
            .font(.subheadline).bold()
            .foregroundColor(backgroundColor.opacity(1))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(backgroundColor.opacity(0.25))
            )
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 24)
//            .offset(y: -5)
    }
}

struct DescriptionView: View {
    let pokemon: Pokemon
    var body: some View {
        
        Text(pokemon.description)
            .font(.headline)
            .padding()
//            .offset(y: -5)
    }
}
