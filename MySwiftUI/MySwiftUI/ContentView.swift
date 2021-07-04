//
//  ContentView.swift
//  MySwiftUI
//
//  Created by Dominic Swaine on 04/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image(systemName: "swift")
            Text("Howdy, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
