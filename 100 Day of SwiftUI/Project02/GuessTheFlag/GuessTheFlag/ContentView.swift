//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ronaldo Gomes on 03/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        //Stack vertical
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello, world!")
            //Permite a criacao de espacos entre o conteudo da stack
            Spacer()
            Text("This is inside a stack")
            Spacer()
        }
        //Gradiente circular
        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 50, endRadius: 200)

        
        //Stack horizontal
        HStack(spacing: 20) {
            Text("Hello World")
            Text("This is inside a stack")
        }
        //Gradiente linear
        LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)

        
        //Stack de visualizacao em profundidade
        ZStack(alignment: .top) {
            //Muda a cor da safe area
            Color.orange
            Text("Hello World")
                .background(Color.white)
        }
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
        //Botao com uma action
        Button(action: {
            print("Button was tapped")
        }) {
            //Criando um botao complexo com uma stack horizontal e uma imagem
            HStack(spacing: 10) {
                Image(systemName: "pencil")
                Text("Edit")
            }
        }

        //Criando alertas, ele volta a variavel para falso automaticamente
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
