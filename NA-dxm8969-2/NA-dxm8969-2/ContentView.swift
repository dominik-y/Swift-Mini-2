//
//  ContentView.swift
//  NA-dxm8969-2
//
//  Created by Dominik Maric on 19.10.2021..
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var articleViewModel = ArticleViewModel()
    @ObservedObject private var newsViewModel = NewsStandViewModel()
    
    private var articles: [Article] {
        return articleViewModel.articleData
    }
    
    private var newsStand: [NewsStand] {
        return newsViewModel.newsStandData
    }
    
    var body: some View {
        TabView {
            NavigationView{
                    List{
                        ForEach(articles) { article in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(article.title).fontWeight(.bold).lineLimit(1)
                                Text(article.category.description)
                            }
                        }
                    }
                .navigationTitle("News")
            }.tabItem({
                Image(systemName: "waveform.path.ecg")
                Text("News")
            })
            
            
            NavigationView {
                    List{
                        ForEach(newsStand) { stand in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(stand.name).fontWeight(.bold)
                                Text(stand.category.description)
                            }
                        }
                    }
                    .navigationTitle("News Stands")
            } .tabItem({
                Image(systemName: "location")
                Text("News Stands")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
