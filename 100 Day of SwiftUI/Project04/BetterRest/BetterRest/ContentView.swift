//
//  ContentView.swift
//  BetterRest
//
//  Created by Ronaldo Gomes on 10/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
        // Cria a opcao de aumentar ou dimunir um valor, dentro ou nao de um range e com um passo
        Stepper(value: $sleepAmount, in: 4...12,  step: 0.25) {
            Text("\(sleepAmount, specifier: "%.2g") hours")
        }
        
        //Picker de data
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
