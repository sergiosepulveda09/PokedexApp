//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-05-30.
//

import SwiftUI


class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    init() {
        getPokemon()
    }
    
    private func getPokemon() {
        NetworkManager<[Pokemon]>.fetch(for: URL(string: API.baseURLString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.pokemon = response
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getBackgroundColor(type: String) -> UIColor {
        switch type {
        case "fire":
            return .systemRed
        case "poison":
            return .systemGreen
        case "water":
            return .systemBlue
        case "electric":
            return .systemYellow
        case "psychic":
            return .systemPurple
        case "normal":
            return .systemOrange
        case "ground":
            return .systemGray
        case "flying":
            return .systemTeal
        case "fairy":
            return .systemPink
        default:
            return .systemIndigo
        }
    }
}



