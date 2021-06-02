//
//  StatsView.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-06-01.
//

import SwiftUI

struct StatsView: View {
    let pokemon: Pokemon
    var body: some View {
        VStack {
            Text("Stats")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            BarView(title: "Attack", power: pokemon.attack, color: .red)
            BarView(title: "Defense", power: pokemon.defense, color: .yellow)
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(pokemon: Pokemon(attack: 50, defense: 50, description: "", evolutionChain: [], height: 10, id: 10, imageUrl: "", name: "", type: "", weight: 10))
    }
}

struct BarView: View {
    let title: String
    let power: Int
    let color: Color
    var body: some View {
        HStack {
            Spacer()
            Text(title)
            Spacer()
            Text(String(power))
            Spacer()
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 60)
                    .frame(width: 200 , height: 25)
                    .foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 60)
                    .frame(width: CGFloat((power < 100) ? (200 * power) / 100 : 200) , height: 25)
                    .foregroundColor(color)
                
            }
            Spacer()
            
        }
    }
}
