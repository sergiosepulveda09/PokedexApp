//
//  Pokemon.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-05-30.
//

import Foundation

struct  Pokemon: Decodable, Identifiable {
    let attack: Int
    let defense: Int
    let description: String
    let evolutionChain: [EvolutionChain]?
    let height: Int
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
    let weight: Int
    
    enum CodingKey: String {
        case attack
        case defense
        case description
        case evolutionChain
        case height
        case id
        case imageUrl
        case name
        case type
        case weight
    }
    
}

