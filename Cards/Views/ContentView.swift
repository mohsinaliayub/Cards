//
//  ContentView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .padding(.top, 30)
            
            VStack {
                HStack {
                    Spacer()
                    Button("Done") {  }
                }
                Spacer()
            }
            .padding(.trailing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
