//
//  ConfigurationsView.swift
//  TimesTables
//
//  Created by Ronaldo Gomes on 05/06/21.
//

import SwiftUI

struct ConfigurationsView: View {
    @State private var userNumberChoise: Int = 0
    @State private var trainNumberChoise: Int = 0
    private var numbersChoised = [Int]()
    
    var body: some View {
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
        }
    }
}

struct ConfigurationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationsView()
    }
}
