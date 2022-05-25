//
//  SwiftUIView.swift
//  TabView
//
//  Created by Andres Meneses on 07/05/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        let items = ["item1"]
        List(items, id: \.self) { item in
            HStack {
                AsyncImage(url: URL(string: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg")!)
                VStack {
                    Text("Under the Dome \(item)")
                }
            }
        }
    }
    
    struct FavoritesView_Previews: PreviewProvider {
        static var previews: some View {
            FavoritesView()
        }
    }
}
