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
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    @State private var isShowingRed = false


    var body: some View {
        
        VStack {
            Button("Tap Me") {
                // do nothing
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            //Retangulo aparece ao apertar o botao, com animacao
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
//        //Podemos animar tambem hstacks com letras e draugGesture
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(self.letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num) / 20))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { self.dragAmount = $0.translation }
//                .onEnded { _ in
//                    self.dragAmount = .zero
//                    self.enabled.toggle()
//                }
//        )
        
        
        
//        //Cria um card na tela
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            //Criando o gesture
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
//                    //Com isso ele volta pra posicao original no fim
//                    .onEnded { _ in withAnimation(.spring()) {
//                        self.dragAmount = .zero
//                    } }
//            )
        
        
//        Button("Tap Me") {
//            // do nothing
//            self.enabled.toggle()
//        }
//        //Podemos aplicar multiplas animacoes
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.blue : Color.red)
//        .animation(.default)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
//        Button("Tap Me") {
//            // do nothing
//            //Animacao do botao a cada vez que ele for acionado
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                self.animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

        
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
