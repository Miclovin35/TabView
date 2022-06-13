//
//  ItemDetail.swift
//  TabView
//
//  Created by Andres Meneses on 12/06/22.
//

import SwiftUI

struct ItemDetail: View {
    var show: Show
    
    var body: some View {
        ScrollView {
            
            // TODO: Present Image
            AsyncImage(url: URL(string: show.image.medium)!)
//                .frame(width: UIScreen.main.bounds.width * 0.8)
//                .fixedSize()
//                .padding(.horizontal)
            
            Spacer()
            
            // TODO: Present Show description
            Text(show.summary.html2String)
                .padding(.horizontal)
            
        }
        .navigationBarTitle(show.name)
    }
}

struct MockShow {
    let show: Show
    init(name: String = "Under the dome",
         language: String = "EN",
         image: ShowImage = .init(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                  original: ""),
         summary: String = "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>") {
        self.show = .init(name: name,
                          language: language,
                          image: image,
                          summary: summary)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let show: Show = MockShow().show
    static var previews: some View {
        Group {
            ItemDetail(show: show)
            
            ItemDetail(show: show)
                .preferredColorScheme(.dark)
        }
    }
}
