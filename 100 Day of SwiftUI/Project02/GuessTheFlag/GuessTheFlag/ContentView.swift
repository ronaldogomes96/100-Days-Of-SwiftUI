//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ronaldo Gomes on 03/04/21.
//

import SwiftUI

struct ContentView: View {
    //Lista de paises do jogo
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled() // Randomiza o array
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State var isCorrect = false
    @State var isIncorrect = false
    
    @State var userScore = 0
    
    var body: some View {
        ZStack {
            //Cor de background, com um gradiente
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.isCorrect.toggle()
                    }) {
                        FlagImages(imageName: self.countries[number])
                            .rotation3DEffect(
                                .degrees(360),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                }
                
                Text("Your Score is \(userScore)")
                    .foregroundColor(.white)
                
                //Sobe tudo para o inicio da view
                Spacer()
            }
        }
        //Cria o alerta que sera executado a cada mudanca da variavel showingScore
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            isCorrect = true
            userScore += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            isIncorrect = true
            userScore -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImages: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            //Ajustes e configuracoes de imagens
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}
