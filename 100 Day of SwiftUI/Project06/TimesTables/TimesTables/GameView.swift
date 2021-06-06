//
//  GameView.swift
//  TimesTables
//
//  Created by Ronaldo Gomes on 05/06/21.
//

import SwiftUI

struct GameView: View {
    private var numbersForMultipler: [Int] = [1,2,3,4,5,6,7,8,9,10]
    private var number: Int = 0
    
    private var result: Int = 0
    var body: some View {
        Text(" \(number) X \(getRandomNumber())")
        
    }
    
    func getRandomNumber() -> Int {
        return numbersForMultipler.randomElement()!
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
