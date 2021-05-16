//
//  ContentView.swift
//  Moonshot
//
//  Created by Ronaldo Gomes on 15/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                // Chama a proxima tela
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
        
        VStack {
            // Funciona como um adaptador do tamanho da tela pra imagem. Dessa forma ela fica com aspecto correto nao importa o tamanho da tela. Ele automaticamente tem o width e height
            GeometryReader { geo in
                Image("Example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
        
        // Exemplo de scrollView
        ScrollView(.vertical) {
            // A vstack cria todas as instancias da classe automaticamente, ja o List nao
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}
