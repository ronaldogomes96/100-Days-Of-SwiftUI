//
//  ContentView.swift
//  WinOrLose
//
//  Created by Ronaldo Gomes on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    @State var possibleMoves = ["Rock", "Paper", "Scissors"].shuffled()
    @State var numberMove = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var score = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                VStack(spacing: 20) {
                    Text("This is a mental game exercise")
                    Text("Your score is \(score)")
                    Text("I pick \(self.possibleMoves[numberMove])")
                    Text("You should \(shouldWin ? "Win" : "Lose")")
                }
                VStack(spacing: 10) {
                    ForEach(0..<3) { number in
                        Button(action: {
                            buttonTaped(number)
                        }) {
                            Text("\(self.possibleMoves[number])")
                                .padding()
                                .foregroundColor(.black)
                                .font(.body)
                                .border(Color.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
        }
    }
    
    func buttonTaped(_ buttonNumber: Int) {
        if possibleMoves[buttonNumber] == self.possibleMoves[numberMove] {
            score = (shouldWin ? score+1 : score-1)
        } else {
            score = (shouldWin ? score-1 : score+1)
        }
        numberMove = Int.random(in: 0...2)
        possibleMoves.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
