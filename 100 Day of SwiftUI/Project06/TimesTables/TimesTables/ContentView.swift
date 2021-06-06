//
//  ContentView.swift
//  TimesTables
//
//  Created by Ronaldo Gomes on 05/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var gameIsRunning = true
    @State private var userNumberChoise: Int = 0
    @State private var trainNumberChoise: Int = 0
    @State private var useranswer: String = ""
    private var numbersForMultipler: [Int] = [1,2,3,4,5,6,7,8,9,10]
    @State private var randomElement = 0

    
    var body: some View {
        NavigationView {
            Group {
                if gameIsRunning {
                    ForEach(0...trainNumberChoise, id: \.self) {
                        Text("Question \($0)")
                            .padding()
                        Text("\(userNumberChoise) X \(getRandomNumber())")
                            .padding()
                        TextField("Answer", text: $useranswer, onCommit: {
                            correctAnswe() ? Text("Correct") : Text("Wrong")
                            
                        })
                        .border(Color(UIColor.separator))
                        .keyboardType(.numberPad)
                    }
                } else {
                    Form {
                        Section(header: Text("Chose de number")) {
                            Stepper(value: $userNumberChoise , in: 0...12) {
                                Text("Time Table for \(userNumberChoise)")
                            }
                        }
                        Section(header: Text("How much did you want train")) {
                            Stepper(value: $trainNumberChoise , in: 1...20, step: 4) {
                                Text("You want train \(trainNumberChoise) times")
                            }
                        }
                        Button("Go Game", action: {
                            gameIsRunning.toggle()
                        })
                        
                    }
                    
                }
            }
            .navigationTitle("Time Tables")
        }
        
    }
    
    func getRandomNumber() -> Int {
        randomElement = numbersForMultipler.randomElement()!
        return randomElement
    }
    
    func correctAnswe() -> Bool {
        if Int(useranswer) == (randomElement * userNumberChoise) {
            return true
        }
        
        return false
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
