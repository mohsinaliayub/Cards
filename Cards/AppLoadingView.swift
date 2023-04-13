//
//  AppLoadingView.swift
//  Cards
//
//  Created by Mohsin Ali Ayub on 13.04.23.
//

import SwiftUI

// This view will determine whether we are showing the animation or not.
struct AppLoadingView: View {
    @State private var showSplash = true
    
    var body: some View {
        if showSplash {
            SplashScreen()
                .edgesIgnoringSafeArea(.all)
        } else {
            CardsView()
        }
    }
}

struct AppLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AppLoadingView()
            .environmentObject(CardStore(defaultData: true))
    }
}
