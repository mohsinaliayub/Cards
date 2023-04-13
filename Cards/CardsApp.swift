//
//  CardsApp.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 03.04.23.
//

import SwiftUI

@main
struct CardsApp: App {
    @StateObject private var viewState = ViewState()
    @StateObject private var store = CardStore(defaultData: true)
    
    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .environmentObject(viewState)
                .environmentObject(store)
        }
    }
}
