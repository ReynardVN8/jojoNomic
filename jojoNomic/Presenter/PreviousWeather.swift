//
//  PreviousWeather.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import SwiftUI
import CoreData

struct PreviousWeather: View {
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                
            }) {
                Text("Refresh")
            }
            List(0 ..< 5) { item in
                HStack {
                    VStack {
                        Text("City")
                        Text("Date")
                    }
                    Spacer()
                    Text("Weather")
                }
            }
        }.padding()
    }

}

struct PreviousWeather_Previews: PreviewProvider {
    static var previews: some View {
        PreviousWeather()
    }
}
