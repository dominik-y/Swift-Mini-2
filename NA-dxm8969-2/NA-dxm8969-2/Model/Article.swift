//
//  Article.swift
//  NA-2
//
//  Created by Andrej Saric.
//

import Foundation

struct Article: Codable {
    let id: Int
    let title: String
    let content: String
    let imageUrl: String
    let url: String
    let author: String
    let publishedAt: String
    let source: String
    let views: Int
    let rating: Int
    let relatedArticles: [Int]
    let category: Category
}
