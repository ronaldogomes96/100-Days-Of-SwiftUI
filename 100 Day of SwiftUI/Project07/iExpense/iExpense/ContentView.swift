//
//  ContentView.swift
//  iExpense
//
//  Created by Ronaldo Gomes on 06/05/21.
//

import SwiftUI

struct ContentView: View {
    //Podemos usar a struct para pegar os valores e isso funciona para uma view, porem para mais de uma nao pois é feita a copia da struct
    @ObservedObject  private var user = User()
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        
        VStack {
            List {
                ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }
                // Permite a opcao de delete
                .onDelete(perform: { indexSet in
                    numbers.remove(atOffsets: indexSet)
                })
            }
            
            Button("Add Number") {
                self.numbers.append(self.currentNumber)
                self.currentNumber += 1
            }
        }
        
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//        Button("Show Sheet") {
//            // show the sheet
//            self.showingSheet.toggle()
//        }
//        //Mostrando uma outra tela
//        .sheet(isPresented: $showingSheet, content: {
//            //Podemos passar parametros
//            SecondView(name: "Ronaldo")
//        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Poderiamos trasnformar em classe porem ele nao atualiza com @state
//struct User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

/*
 @Published é mais ou menos metade de @State: ele diz ao Swift que sempre que uma dessas duas propriedades muda, ele deve enviar um anúncio para qualquer visualização do SwiftUI que está observando que eles devem recarregar.
 */
class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
