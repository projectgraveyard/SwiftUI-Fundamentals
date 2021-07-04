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
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .padding()
                .background(Color.orange)
                .padding([.leading, .bottom, .trailing])
            Text("Howdy, world!")
                .fontWeight(.bold)
                .kerning(5.0)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
