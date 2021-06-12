//
//  SearchBar.swift
//  PokedexApp
//
//  Created by Sergio Sepulveda on 2021-06-11.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchItem: String
    @State private var isEditing: Bool = false
    @State private var pokemonType: Int =  0
    let typesPokemon: [String] = ["Fire", "Poison", "Water", "Electric"]
    var body: some View {
        HStack {
            HStack(spacing: -10) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                TextField("Search Here", text: $searchItem)
                    .padding(.leading, 20)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                if searchItem.count != 0 {
                    Button(action: {
                        self.searchItem = ""
                        self.isEditing.toggle()
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                    })
                    .padding(.leading)
                }
                
            }
            .padding()
            .background(Color(.systemGray6).opacity(0.4))
            
            if isEditing {
                Button(action: {
                    self.isEditing.toggle()
                    self.searchItem = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
        }
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchItem: Binding.constant(""))
    }
}
