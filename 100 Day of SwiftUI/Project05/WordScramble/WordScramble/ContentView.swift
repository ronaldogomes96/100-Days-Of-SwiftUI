//
//  ContentView.swift
//  WordScramble
//
//  Created by Ronaldo Gomes on 26/04/21.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        // List cria celulas na tela
        List {
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
        }
        //Faz ficar com estilo mais parecido com form
        .listStyle(GroupedListStyle())
        
        List {
            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }
        }
        
        List {
            Text("Static row 1")
            Text("Static row 2")

            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }

            Text("Static row 3")
            Text("Static row 4")
        }
        
        // Podemos fazer list com sections, porem fica mais bonita com form
        List {
            Section(header: Text("Section 1")) {
                Text("Static row 1")
                Text("Static row 2")
            }

            Section(header: Text("Section 2")) {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                }
            }

            Section(header: Text("Section 3")) {
                Text("Static row 3")
                Text("Static row 4")
            }
        }
        
        //Criando as list sem for each, totalmente dinamica
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
        
        //Podemos usar o id:./ para referenciar array de dados
        List(people, id: \.self) {
            Text($0)
        }
        
        //Foreach funciona da mesma forma
        List {
            ForEach(people, id: \.self) {
                Text($0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
