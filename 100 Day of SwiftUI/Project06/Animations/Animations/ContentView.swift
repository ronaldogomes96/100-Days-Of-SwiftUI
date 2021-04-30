//
//  ContentView.swift
//  Animations
//
//  Created by Ronaldo Gomes on 29/04/21.
//

import SwiftUI

struct ContentView: View {
    //@State private var animationAmount: CGFloat = 1
    @State private var animationAmount = 0.0


    var body: some View {
        
        Button("Tap Me") {
            // do nothing
            //Animacao do botao a cada vez que ele for acionado
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

        
        // Trabalhando com bindings e animations
//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                Animation.easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                self.animationAmount += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
        
        
//        Button("Tap Me") {
//            // self.animationAmount += 1
//        }
//        .padding(40)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        // Cria um circulo ao redor do botao
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .onAppear {
//            self.animationAmount = 2
//        }
        /*
         Exemplos de animacao
         .animation(.interpolatingSpring(stiffness: 50, damping: 1))
         .animation(.easeInOut(duration: 2)) 2 segundos de animacao
         .animation(
            Animation.easeInOut(duration: 2)
            .delay(1) Animacao com delay
         )
         .animation(
             Animation.easeInOut(duration: 1)
                 .repeatCount(3, autoreverses: true)
         )
         .animation(
             Animation.easeInOut(duration: 1)
                 .repeatForever(autoreverses: true)
         )
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
