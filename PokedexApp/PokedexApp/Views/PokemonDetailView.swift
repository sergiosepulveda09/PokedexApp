
import Kingfisher
import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    let pokemonVM: PokemonViewModel
    let backgroundColor: Color
    @Binding var show: Bool
    @State var isSmallDevice = UIScreen.main.bounds.height < 750

    var body: some View {
        VStack {
            HeatherView(pokemon: pokemon, pokemonVM: pokemonVM, show: $show)
            
            PokemonImageView(pokemon: pokemon, pokemonVM: pokemonVM)
            
            DescriptionPokemonView(pokemon: pokemon, pokemonVM: pokemonVM)
        }
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
    }
}
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon(attack: 10, defense: 10, description: "ss", evolutionChain: [], height: 10, id: 10, imageUrl: "Bulbasaur", name: "Sergio", type: "Strong", weight: 10), pokemonVM: PokemonViewModel(), backgroundColor: .green, show: .constant(true))
    }
}


struct HeatherView: View {
    let pokemon: Pokemon
    let pokemonVM: PokemonViewModel
    @Binding var show: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Button(action: {
                    withAnimation(.easeOut) {
                        show.toggle()
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                
                //                    Text("")
                //                        .fontWeight(.bold)
                //                        .foregroundColor(.white)
                //                        .padding(.top)
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.top)
            }
            
            Spacer(minLength: 0)
            
        } // Heather View
        .padding()
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
    }
}

struct PokemonImageView: View {
    let pokemon: Pokemon
    let pokemonVM: PokemonViewModel
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Type")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(pokemon.type.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            KFImage(URL(string: pokemon.imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
        } // Pokemon View
        .padding()
        .padding(.top, 10)
        .zIndex(1)
    }
}

struct DescriptionPokemonView: View {
    let pokemon: Pokemon
    let pokemonVM: PokemonViewModel
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Weight:")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("\(String(pokemon.weight)) Kg" )
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.bottom)
                        
                    }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Size:")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("\(String(pokemon.height)) Cm")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                Text(pokemon.description)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding()
                
                
                StatsView(pokemon: pokemon)
                    .padding(.bottom)
            }
        }
        .background(
            Color.white
                .clipShape(CustomCorner())
                .padding(.top, isSmallDevice ? CGFloat(-60) : -100)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: -30)
        )
        .zIndex(0)
    }
}
