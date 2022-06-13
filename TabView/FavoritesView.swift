//
//  SwiftUIView.swift
//  TabView
//
//  Created by Andres Meneses on 07/05/22.
//

import SwiftUI

struct ShowImage: Decodable {
    let medium: String
    let original: String
}

struct Show: Decodable {
    let name: String
    let language: String
    let image: ShowImage
    let summary: String
}

extension Show: Identifiable {
    var id: String {
        return name
    }
}

struct FavoritesView: View {
    @State var shows = [Show]()
    var body: some View {
        NavigationView {
            List(shows) { show in
                NavigationLink(destination: ItemDetail(show: show)) {
                    HStack {
                        AsyncImage(url: URL(string: show.image.medium)!)
                        VStack {
                            Text(show.name)
                        }
                    }
                }
            }
        }.task {
            let url = URL(string: "https://api.tvmaze.com/shows")!
            let (data, response) = try! await URLSession.shared.data(from: url )
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode  else { return }
            let shows = try! JSONDecoder().decode([Show].self, from: data)
            self.shows = shows
        }
    }
    
    struct FavoritesView_Previews: PreviewProvider {
        static var previews: some View {
            FavoritesView()
        }
    }
}
