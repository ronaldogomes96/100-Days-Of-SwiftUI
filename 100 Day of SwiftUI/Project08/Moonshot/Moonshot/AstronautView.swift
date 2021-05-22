//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ronaldo Gomes on 16/05/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    List(getAllMissionsForAstronout()) {
                        Text($0.displayName)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    func getAllMissionsForAstronout() -> [Mission] {
        let missions: [Mission] = Bundle.main.decodeForAstronautArray("missions.json")
        var missionsForAstronauts = [Mission]()
        for creaw in missions {
            for astro in creaw.crew {
                if astro.name == astronaut.id {
                    missionsForAstronauts.append(creaw)
                }
            }
        }
        
        return missionsForAstronauts
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decodeForAstronautArray("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
