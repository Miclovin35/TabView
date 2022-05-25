//
//  ContentView.swift
//  TabView
//
//  Created by Andres Meneses on 26/04/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Showsview()
                .tabItem {
                    Image (systemName: "rectangle.stack.fill")
                    Text ("Home")
                }
            
            FavoritesView()
                .tabItem {
                    Image (systemName: "star.fill")
                    Text ("favourite")
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
