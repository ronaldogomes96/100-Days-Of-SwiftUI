//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Ronaldo Gomes on 07/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .padding()
            .background(Color.red)
            .padding()
            .background(Color.blue)
            .padding()
            .background(Color.green)
            .padding()
            .background(Color.yellow)
        Button("Hello World") {
            print(type(of: self.body))
        }
        .background(Color.red)
        .frame(width: 200, height: 200)
        Text("Big Title")
            .titleLargeAndBlue()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleLargeAndBlue() -> some View {
        self.modifier(Title())
    }
}
