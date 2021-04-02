//
//  ContentView.swift
//  TimeConverter
//
//  Created by Ronaldo Gomes on 02/04/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTime = ""
    @State private var inputTimeType = 0
    @State private var outputTimeType = 0
    
    let time = ["Second", "Minute", "Hour", "Day"]

    var outputTime: String {
        var output: Double = Double(inputTime) ?? 0
        if inputTimeType == 1 {
            output = (Double(inputTime) ?? 0) * 60
        } else if inputTimeType == 2 {
            output = (Double(inputTime) ?? 0) * 60 * 60
        } else if inputTimeType == 3 {
            output = (Double(inputTime) ?? 0) * 60 * 60 * 24
        }
        
        switch outputTimeType {
        case 1:
            output /= 60
        case 2:
            output /= (60*60)
        case 3:
            output /= (60*60*24)
        default:
            output = Double(inputTime) ?? 0
        }
        
        return String(output)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choise your time input")) {
                    Picker("Time input", selection: $inputTimeType) {
                        ForEach(0 ..< time.count) {
                            Text("\(self.time[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Choise your time output")) {
                    Picker("Time input", selection: $outputTimeType) {
                        ForEach(0 ..< time.count) {
                            Text("\(time[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Type your number for convert")) {
                    TextField("Number", text: $inputTime)
                }
                Section(header: Text("Result")) {
                    Text("\(outputTime)")
                }
            }
            .navigationTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
