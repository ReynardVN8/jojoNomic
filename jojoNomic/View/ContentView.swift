//
//  ContentView.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            FunctionPresenter()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
