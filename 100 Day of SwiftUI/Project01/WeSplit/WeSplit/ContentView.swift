//
//  ContentView.swift
//  WeSplit
//
//  Created by Ronaldo Gomes on 30/03/21.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        
        VStack {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
        var tapCount = 0
        
        //Dentro da navigation
        NavigationView {
            
            Form {
                //Criando entradas na tela
                Text("Hello World")
                Text("Hello World")
                
                //Podemos tambem criar dentro de groups
                Group {
                    Text("Hello World")
                }
                
                //Ou dentro de sections, que sao mais organizadas, como uma table view
                Section {
                    Text("Hello World")
                }
                
                Section {
                    Text("Hello World")
                    Text("Hello World")
                }
            }
            
            //
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }
            
            //Titulo da navigationBar
            .navigationBarTitle("SwiftUI")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
