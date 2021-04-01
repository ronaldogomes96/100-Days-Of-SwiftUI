//
//  ContentView.swift
//  WeSplit
//
//  Created by Ronaldo Gomes on 30/03/21.
//

import SwiftUI

struct ContentView: View {
    //Variaveis que serao usadas, precisam do @state para serem mudadas
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    //Variavel computada que calcula o valor da gorjeta de cada pessoa
    var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = (orderAmount / 100) * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    //Cria um textField e ja passa o placeholder com a variavel que vai guardar esse valor
                    TextField("Amount", text: $checkAmount)
                        //Quando acessamos o ponto logo apos um tipo, acessamos atributos dele
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                //Podemos adicionar um header com informacoes para a section
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    //Com isso fica uma segmented control
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    //Atualiza automaticamente
                    Text("$\(totalPerson, specifier: "%.2f")")
                }
            }
            //Informando o titulo da navigation
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
